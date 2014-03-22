class Rating < ActiveRecord::Base
  include RatingAverage

  belongs_to :recipe
  belongs_to :user

  validates_numericality_of :score, { :greater_than_or_equal_to => 1,
                                      :less_than_or_equal_to => 10,
                                      :only_integer => true }

  #scope :recent, -> { Rating.limit(5).order(:created_at) }
  scope :recent, -> { order(created_at: :desc).limit(5) }

end
