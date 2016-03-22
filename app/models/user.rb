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
end
