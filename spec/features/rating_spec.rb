require 'spec_helper'

include OwnTestHelper

describe "Rating" do

  let!(:recipe1) { FactoryGirl.create :recipe, name: "soup1" }
  let!(:recipe2) { FactoryGirl.create :recipe, name: "soup2" }
  let!(:category) { FactoryGirl.create :category }
  let!(:user) { FactoryGirl.create :user }


  before :each do
    sign_in(username: "Div", password: "SSS1")
  end

  it "when rated, its registered to rated recipe and user who is signed in" do
    visit new_rating_path
    select('soup1', from:'rating[recipe_id]')
    fill_in('rating[score]', with: '5')

    expect{
      click_button "Create Rating"
    }.to change{Rating.count}.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(recipe1.ratings.count).to eq(1)
    expect(recipe1.average_rating).to eq(5)
  end


  it "is not saved when rating the same recipe twice as the same user" do
        FactoryGirl.create(:rating, user:user, recipe:recipe1)
        visit new_rating_path
        select('soup1', from:'rating[recipe_id]')
        fill_in('rating[score]', with: '5')
        click_button "Create Rating"
        expect(user.ratings.count).to eq(1)
  end

  it "can be edited" do
        rating = FactoryGirl.create(:rating, user:user, recipe:recipe1)
        visit edit_rating_path(rating)
        fill_in('rating[score]', with: '1')
        click_button "Update Rating"
        expect(page).to have_content "Rating was successfully updated"
        expect(page).to have_content "1"
  end

  describe "when many exists" do

      let!(:user2) { FactoryGirl.create(:user, username:'Duv') }

      let!(:rating1) { FactoryGirl.create(:rating, id: 1, score:2, recipe:recipe1, user:user) }
      let!(:rating2) { FactoryGirl.create(:rating, id: 2, score:5, recipe:recipe1, user:user) }
      let!(:rating3) { FactoryGirl.create(:rating, id: 3, score:8, recipe:recipe2, user:user2) }


    it "all are listed at the ratings page" do
      visit ratings_path
      expect(page).to have_content "Recent ratings"
      expect(page).to have_content "soup1"
      expect(page).to have_content "soup2"
      expect(page).to have_content "2"
      expect(page).to have_content "5"
      expect(page).to have_content "8"
    end

    it "user can delete his own ratings" do
      visit ratings_path
      #expect { Destroy :destroy, :id => 1}.to change{Rating.count}.by(-1)
      expect{
        page.first('a', text:'Destroy').click
      }.to change{Rating.count}.by(-1)
    end

    it "can't access show or edit on someone else's rating" do
       visit edit_rating_path(rating3)
       expect(page).to have_content "Insufficient rights!"
       visit rating_path(rating3)
       expect(page).to have_content "Insufficient rights!"
    end

  end

end