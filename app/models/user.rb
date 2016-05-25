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


  def self.from_omniauth(auth_hash)
    
    @user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    byebug
    @user.name = auth_hash['info']['name']
    @user.email = auth_hash['info']['email']
    @user.password = " "
    @user.save
    @user
  end



end

