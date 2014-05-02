class Recipe < ActiveRecord::Base
  include RatingAverage

  has_many :ratings, dependent: :destroy

  has_many :user_recipes
  has_many :users, through: :user_recipes

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  belongs_to :category

  scope :public, -> { where private:false }

  validates_numericality_of :production_time, :greater_than_or_equal_to => 1,
                            :less_than_or_equal_to => 300,
                            :only_integer => true

  validates :name, presence: true, length: {in: 3..40}

  def productionTimeToString (timeMin)
    hours = (timeMin.to_i/60.to_i)
    if hours.to_i == 0
      timeMin.to_s + "min"
    else
      min = timeMin.to_i-(hours.to_i*60.to_i)
      if min == 0
         return hours.to_s + "h"
      else
         return hours.to_s + "h " + min.to_s + "min"
      end
    end
  end

end
