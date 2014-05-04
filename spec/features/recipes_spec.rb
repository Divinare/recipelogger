require_relative '../spec_helper'
include OwnTestHelper

describe "Recipes page" do

  let!(:user) { FactoryGirl.create :user }
  let!(:category) { FactoryGirl.create :category }

  it "should not have any recipes before been created" do
    visit recipes_path
    expect(page).to have_content 'Public recipes (0)'
  end

  it "should have public and private recipes listed" do
    recipe1 = create_recipe(10, category, user, "soup1", true)
    recipe2 = create_recipe(5, category, user, "soup2", false)
    sign_in(username: "Div", password: "SSS1")
    visit recipes_path
    expect(page).to have_content 'Your private recipes (1)'
    expect(page).to have_content 'Your public recipes (1)'
  end


  it "should have average rating" do
    recipe = create_recipe(10, category, user, "soup1", false)
    visit recipes_path
    expect(page).to have_content '10'
    expect(page).to have_content 'Average rating'
  end

  describe "should allow user to" do

    before :each do
      sign_in(username: "Div", password: "SSS1")
    end

    it "create a new recipe" do
        visit new_recipe_path
        fill_in('recipe[name]', with:'soup3')
        fill_in('recipe[production_time]', with: 20)
        select('entree', from: 'recipe[category_id]')
        expect{
          click_button "Create Recipe"
        }.to change{Recipe.count}.from(0).to(1)

    end


    it "destroy his own recipe" do
      recipe = FactoryGirl.create(:recipe)
      FactoryGirl.create(:user_recipe, recipe:recipe, user:user)
      visit recipe_path(recipe)
      expect(page).to have_content "Destroy"
      expect{
        page.first('a', text:'Destroy').click
      }.to change{Recipe.count}.by(-1)
    end

    it "edit his own recipe" do
      recipe = FactoryGirl.create(:recipe)
      FactoryGirl.create(:user_recipe, recipe:recipe, user:user)
      visit edit_recipe_path(recipe)
      fill_in('recipe[name]', with:'supersoup')
      fill_in('recipe[production_time]', with: 60)
      select('entree', from: 'recipe[category_id]')
      click_button "Update Recipe"
      expect(page).to have_content "supersoup"
      expect(page).to have_content "Recipe was successfully updated"

    end

  end

end

