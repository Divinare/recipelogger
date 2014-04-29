require 'spec_helper'

describe User do
  it "has the username set correctly" do
    user = User.new username:"Div"

    user.username.should == "Div"
  end

  it "is not saved without a password" do
    user = User.create username:"Div"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is saved with a proper password" do
    user = User.create username:"Div", password:"Secret1", password_confirmation:"Secret1"

    expect(user.valid?).to be(true)
    expect(User.count).to eq(1)
  end

  it "is not saved with too short password" do
    user = User.create username:"Div", password:"ss1", password_confirmation:"ss1"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)


  end


end

