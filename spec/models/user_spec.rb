require 'spec_helper'

describe User do
  it "has the username set correctly" do
    user = User.new username: "Div"

    user.username.should == "Div"
  end

  describe "is not saved when password" do
    it "is missing" do
      user = User.create :username => "Div"

      expect(user).not_to be_valid
      expect(User.count).to eq(0)
    end

    it "is too short" do
      user = User.create username: "Div", password: "Ss1", password_confirmation: "Ss1"

      expect(user).not_to be_valid
      expect(User.count).to eq(0)
    end

    it "has no big case letter" do
      user = User.create username: "Div", password: "sss1", password_confirmation: "sss1"

      expect(user).not_to be_valid
      expect(User.count).to eq(0)
    end

    it "has no number" do
      user = User.create username: "Div", password: "Ssss", password_confirmation: "Ssss"

      expect(user).not_to be_valid
      expect(User.count).to eq(0)
    end
  end

  describe "with a proper password" do

    it "is saved" do
      user = User.create username: "Div", password: "Secret1", password_confirmation: "Secret1"

      expect(user.valid?).to be(true)
      expect(User.count).to eq(1)
    end
  end
end

