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

  def content_notes
    self.notes.select{|note| note if (note.content != "")}
  end

end
