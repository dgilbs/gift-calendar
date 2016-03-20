require 'rails_helper'

describe User do 

  before(:each) do 
    @user1=User.create(name: "Joe", email: "joe@yahoo.com", password: "ilovegifts")
    @user2=User.new(email:"bob@yahoo.com", password: "giftsarecool")
    @user3=User.new(name:"Ken", password: "giftreceipt")
    @user4=User.new(name: "Rachel", password: "returnpolicy")
  end 

  it 'creates a new user' do 
    expect(@user1.class).to eq(User)
  end 

  it 'is valid with all the proper attributes' do 
    expect(@user1).to be_a(User)
  end

  it 'is invalid without a name' do 
    expect(@user2).to be_invalid
  end

  it 'is invalid without an email address' do 
    expect(@user3).to be_invalid 
  end

  it 'is invalid without a password' do 
    expect(@user4).to be_invalid
  end


end