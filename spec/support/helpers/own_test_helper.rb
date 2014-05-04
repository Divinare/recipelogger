
module OwnTestHelper

  def sign_in(credentials)
    visit signin_path
    fill_in('username', with:credentials[:username])
    fill_in('password', with:credentials[:password])
    click_button('Log in')
  end

  def create_recipe(score, category, user, name, private)
    recipe = FactoryGirl.create(:recipe, category:category, name:name, private:private)
    FactoryGirl.create(:rating, score:score, recipe:recipe, user:user)
    FactoryGirl.create(:user_recipe, user:user, recipe:recipe)
    recipe

  end

end