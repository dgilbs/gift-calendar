# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  date        :date
#  notes       :text
#  calendar_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :user
  has_many :notes
  accepts_nested_attributes_for :notes
  validates_presence_of :name, :date 
  
  

  def notes_attributes=(notes_hashes)
    notes_hashes.each do |k, notes_hash|
      self.notes.build(notes_hash) if (notes_hash[:content] != "")
    end
  end

  def user_events
    self.user.events
  end

  def conflicts
    self.user_events.select do |event|
      (event.date == self.date) && event != self
    end
  end

  def note_content
    self.notes.map do |note|
      note.content
    end
  end


end
