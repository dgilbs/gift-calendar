# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :calendars
  has_many :events, through: :calendars
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email

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

  def self.omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.token = auth.credentials.token
      # user.expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end

