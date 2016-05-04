require 'rails_helper'

  describe Event do 

    it 'creates a event with valid attributes' do
      @user=User.create(name: "Joe", email:"joe@yahoo.com", password: "ilovegifts")
      @calendar=@user.calendars.build(name: "Birthdays", description: "People's Birthdays")
      @event1=@calendar.events.build(name: "Dad's birthday", date: '2016-04-02', notes: "maybe a book?")
      expect(@event1.class).to eq(Event)
    end

    it 'is valid without notes' do 
      @user=User.create(name: "Joe", email:"joe@yahoo.com", password: "ilovegifts")
      @calendar=@user.calendars.build(name: "Birthdays", description: "People's Birthdays")
      @event2=@calendar.events.build(name: "Mom's birthday", date: '2016-04-30')     
      expect(@event2).to be_valid
    end

    it 'is invalid without a name' do 
      @user=User.create(name: "Joe", email:"joe@yahoo.com", password: "ilovegifts")
      @calendar=@user.calendars.build(name: "Birthdays", description: "People's Birthdays")
      @event3=Event.new(date: '2016-03-23')  
      expect(@event3).to be_invalid
    end

    it 'is invalid without a date' do 
      @user=User.create(name: "Joe", email:"joe@yahoo.com", password: "ilovegifts")
      @calendar=@user.calendars.build(name: "Birthdays", description: "People's Birthdays")
      @event4=Event.new(name: "My Anniversary")      
      expect(@event4).to be_invalid
    end

    it 'belongs to a calendar' do 
      @user=User.create(name: "Joe", email:"joe@yahoo.com", password: "ilovegifts")
      @calendar=@user.calendars.build(name: "Birthdays", description: "People's Birthdays")
      @event1=@calendar.events.build(name: "Dad's birthday", date: '2016-04-02', notes: "maybe a book?")      
      expect(@event1.calendar).to eq(@calendar)
    end 

    it 'belongs to a user' do
      @user=User.create(name: "Joe", email:"joe@yahoo.com", password: "ilovegifts")
      @calendar=@user.calendars.build(name: "Birthdays", description: "People's Birthdays")
      @event1=@calendar.events.build(name: "Dad's birthday", date: '2016-04-02', notes: "maybe a book?")     
      expect(@event.user).to eq(@user) 
    end

end 