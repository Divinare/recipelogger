#require_relative '../spec_helper'
require 'spec_helper'
include OwnTestHelper

describe "User" do

  let!(:user) { FactoryGirl.create :user }

  describe "who has signed up" do
    it "can sign in with right password" do
      sign_in(username: "Div", password: "SSS1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Div'
    end

    it "is redirected back to sign in form if wrong password is given" do
      sign_in(username: "Div", password: "wrong_password")

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'Username and/or password mismatch'
    end


    it "can delete his own account" do
      sign_in(username: "Div", password: "SSS1")
      visit users_path
      expect{
        page.first('a', text:'Destroy').click
      }.to change{User.count}.by(-1)
    end

    it "can change password" do
      sign_in(username: "Div", password: "SSS1")
      visit edit_user_path(user)
      fill_in('user[password]', with:'EEE1')
      fill_in('user[password_confirmation]', with:'EEE1')
      click_button "Update User"
      visit signout_path
      sign_in(username: "Div", password: "EEE1")
      expect(page).to have_content 'Div'
      expect(page).to have_content 'Welcome back'
    end


    it "is not allowed to see or edit other user's page" do
      FactoryGirl.create :user2, username: 'Duv'
      sign_in(username: "Duv", password: "SSS1")
      visit user_path(user)
      expect(page).to have_content 'Insufficient rights'
      visit edit_user_path(user)
      expect(page).to have_content 'Insufficient rights'
    end

  end

  it "can be signed up with the valid username and password" do
    visit signup_path
    fill_in('user_username', :with => 'Dav')
    fill_in('user_password', :with => 'Secret1')
    fill_in('user_password_confirmation', :with => 'Secret1')

    expect {
      click_button('Create User')
    }.to change { User.count }.by(1)
  end

end