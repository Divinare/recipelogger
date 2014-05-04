require 'spec_helper'

describe Rating do
  before :each do
    FactoryGirl.create :user
    FactoryGirl.create :recipe
  end
  describe "is not saved" do
    it "without score" do
      rating = Rating.create recipe_id: 1, user_id: 1
      expect(rating).not_to be_valid
      expect(Rating.count).to eq(0)
    end

    it "when score is more than 10" do
      rating = Rating.create score: 11, recipe_id: 1, user_id: 1
      expect(rating).not_to be_valid
      expect(Rating.count).to eq(0)
    end

    it "when score is negative" do
      rating = Rating.create score: -1, recipe_id: 1, user_id: 1
      expect(rating).not_to be_valid
      expect(Rating.count).to eq(0)
    end
  end

  it "is saved with right score (1-10)" do
    rating = Rating.create score: 5, recipe_id: 1, user_id: 1
    expect(rating).to be_valid
    expect(Rating.count).to eq(1)
  end

end
