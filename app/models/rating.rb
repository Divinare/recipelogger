class Rating < ActiveRecord::Base
  include RatingAverage

  belongs_to :recipe
  belongs_to :user

  scope :recent, -> { Rating.limit(5).order(:created_at) }

end
