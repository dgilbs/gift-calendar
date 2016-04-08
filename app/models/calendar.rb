# == Schema Information
#
# Table name: calendars
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Calendar < ActiveRecord::Base
  belongs_to :user
  has_many :events
  validates_presence_of :name

  def upcoming_events
    self.events.select do |event|
      event.date > Time.now
    end
  end

  def past_events
    self.events.select do |event|
      event.date < Time.now
    end
  end

  def next_event
    all = self.upcoming_events.sort_by{|event| event.date}
    all.first
  end

  def most_recent_event
    past = self.past_events.sort_by{|event| event.date}
    past.last
  end

  def calendar_notes
    self.events.map do |event|
      event.note_content
    end.flatten
  end
end
