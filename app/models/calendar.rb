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
end
