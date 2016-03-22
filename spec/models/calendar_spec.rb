# require_relative '../rails_helper'

# describe Calendar do 

#   before(:each) do
#     @user=User.create(name: "Joe", email:"joe@yahoo.com", password: "ilovegifts")
#     @valid_calendar=@user.calendars.build(name: "Birthdays", description: "People's Birthdays")
#     @invalid_calendar=Calendar.new(description: "My calendar!")
#   end 

#   it 'creates a new calendar' do
#     expect(@valid_calendar.class).to eq(Calendar)
#   end

#   it 'creates a calendar that belongs to a user' do
#     expect(@valid_calendar.user).to eq(@user)
#   end

#   it 'only creates a calendar with valid attributes' do
#     expect(@valid_calendar).to be_valid
#     expect(@invalid_calendar).to be_invalid
#   end
    
# end