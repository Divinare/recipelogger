require 'spec_helper'

describe Recipe do

  let(:category) { FactoryGirl.create(:category) }

  it "is saved when given all right information " do
     recipe = Recipe.create name:"soup", production_time:"15", instruction:"boil 15 minutes", private: false
     expect(recipe).to be_valid
     expect(Recipe.count).to eq(1)

  end

  it "has working production time function" do

    recipe = Recipe.new :production_time => 135
    recipe.productionTimeToString(recipe.production_time).should == "2h 15min"
  end

  describe "is not saved when" do
    it "production_time is missing" do
       recipe = Recipe.create name:"soup", instruction:"boil 15 minutes", private: false
       expect(recipe).not_to be_valid
       expect(Recipe.count).to eq(0)

    end
  end

end
