class Recipe < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :users, through: :user_recipes

  belongs_to :category



  def productionTimeToString (timeMin)
    hours = (timeMin.to_i/60.to_i)
    if hours.to_i == 0
      timeMin.to_s + "min"
    else
      min = timeMin.to_i-(hours.to_i*60.to_i)
      return hours.to_s + "h " + min.to_s + "min"
    end
  end




end
