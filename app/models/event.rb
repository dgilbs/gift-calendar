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
  validates_presence_of :name, :date 
  
end
