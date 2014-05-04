require_relative '../spec_helper'
include OwnTestHelper

describe Ingredient do

  let!(:recipe1) { FactoryGirl.create :recipe, name: "soup1" }
  let!(:recipe2) { FactoryGirl.create :recipe, name: "soup2" }
  let!(:category) { FactoryGirl.create :category }
  let!(:user) { FactoryGirl.create :user }

  describe "as an admin" do

    before :each do
      sign_in(username: "Div", password: "SSS1")
    end

    it "ingredient is saved with proper name" do
      visit new_ingredient_path
      fill_in('ingredient[name]', with: 'milk')
      expect {
        click_button "Create Ingredient"
      }.to change { Ingredient.count }.from(0).to(1)
    end

    it "ingredient is not saved with too short name" do
      visit new_ingredient_path
      fill_in('ingredient[name]', with: 'r')
      expect {
        click_button "Create Ingredient"
      }.not_to change { Ingredient.count }
    end

    it "ingredient can be destroyed" do
      FactoryGirl.create (:ingredient)

      visit ingredients_path
      expect{
        page.first('a', text:'Destroy').click
      }.to change{Ingredient.count}.by(-1)

    end

    it "ingredient can be edited" do
       ingredient = FactoryGirl.create (:ingredient)
       visit edit_ingredient_path(ingredient)
       fill_in('ingredient[name]', with: 'water')
       click_button "Update Ingredient"
       expect(page).to have_content "Ingredient was successfully updated"
       expect(page).to have_content "water"
    end

  end
end