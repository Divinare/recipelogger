FactoryGirl.define do
  factory :user do
    username "Div"
    password "SSS1"
    password_confirmation "SSS1"
    admin true
  end

  factory :user2, class: User do
    username "Dov"
    password "SSS1"
    password_confirmation "SSS1"
    admin false
  end

  factory :rating do
    score 10
  end

  factory :rating2, class: Rating do
    score 20
  end

  factory :category do
      name "entree"
      description "meat for example"
  end

  factory :recipe do
      name "soup"
      production_time 10
      instruction "boil 10min"
      category_id 1
      private false
  end

  factory :user_recipe, class: UserRecipe do
  end

  factory :ingredient do
      name "sugar"
  end

end