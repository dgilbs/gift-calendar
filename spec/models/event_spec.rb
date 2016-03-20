require 'rails_helper'

  describe Event do 
    before(:each) do
    @user=User.create(name: "Joe", email:"joe@yahoo.com", password: "ilovegifts")
    @calendar=@user.calendars.build(name: "Birthdays", description: "People's Birthdays")
    @event1=@calendar.events.build(name: "Dad's birthday", date: '2016-04-02', notes: "maybe a book?")
    @event2=@calendar.events.build(name: "Mom's birthday", date: '2016-04-30')
    @event3=Event.new(date: '2016-03-23')
    @event4=Event.new(name: "My Anniversary")
    end

    it 'creates a event with valid attributes' do 
      expect(@event1.class).to eq(Event)
    end

    it 'is valid without notes' do 
      expect(@event2).to be_valid
    end

    it 'is invalid without a name' do 
      expect(@event3).to be_invalid
    end

    it 'is invalid without a date' do 
      expect(@event4).to be_invalid
    end

    it 'belongs to a calendar' do 
      expect(@event1.calendar).to eq(@calendar)
    end 

    it 'is belongs to a user' do
      expect(@user.events).to include(@event1) 
    end

end 