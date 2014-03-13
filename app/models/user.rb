class User < ActiveRecord::Base

  has_secure_password

  has_many :ratings, dependent: :destroy

  has_many :user_recipes, dependent: :destroy
  has_many :recipes, through: :user_recipes

end
