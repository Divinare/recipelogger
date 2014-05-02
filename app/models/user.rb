class User < ActiveRecord::Base

  has_secure_password

  has_many :ratings, dependent: :destroy

  has_many :user_recipes, dependent: :destroy
  has_many :recipes, through: :user_recipes


  validates_uniqueness_of :username

  validates_length_of :username, :minimum => 3

  validates_length_of :username, :maximum => 15

  validates_length_of :password, :minimum => 4

  validates :password, :presence => true,
            :format => {:with => /\A(?=.*[A-Z])(?=.*[0-9]).{3,}\z/, message: "password must contain at least one number and one big case letter"}




end
