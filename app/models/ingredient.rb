class Ingredient < ActiveRecord::Base

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true

  validates_uniqueness_of :name

  validates_length_of :name, :minimum => 3

  validates_length_of :name, :maximum => 30

end
