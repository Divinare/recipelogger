require 'spec_helper'

include OwnTestHelper

describe "Category" do

  let!(:user) { FactoryGirl.create :user }
  let!(:category) { FactoryGirl.create :category }

  before :each do
    sign_in(username: "Div", password: "SSS1")
  end

     it "can be created by an admin" do
       visit new_category_path
       fill_in('category[name]', with:'drinks')
       fill_in('category[description]', with:'coctails for example')
       expect{
         click_button "Create Category"
       }.to change{Category.count}.from(1).to(2)
     end

     it "can be destroyed by an admin" do
       visit categories_path
       expect{
         page.first('a', text:'Destroy').click
       }.to change{Category.count}.by(-1)

     end

     it "cannot be destroyed by an admin if it has some recipes related to" do
       FactoryGirl.create(:recipe, category:category)

       visit categories_path
       expect{
         page.first('a', text:'Destroy').click
       }.to change{Category.count}.by(0)
       expect(page).to have_content "Deleting category not possible"

     end

    it "can be seen at the index page" do
      visit categories_path
      expect(page).to have_content "Listing categories"
    end

    it "can be edited" do
      visit edit_category_path(category)
      fill_in('category[name]', with:'fruit')
      fill_in('category[description]', with:'banana')
      click_button "Update Category"
      expect(page).to have_content "fruit"
      expect(page).to have_content "banana"
      expect(page).to have_content "Category was successfully updated"
    end
end