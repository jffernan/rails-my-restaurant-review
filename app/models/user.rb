class User < ApplicationRecord
  #has_many :reviews, dependent: :destroy #destory user reviews in db
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  has_many :reviews, dependent: :destroy #delete user=>deletes their reviews from db
  has_many :restaurants, through: :reviews

  def review
    self.review = Review.find(params[:id])
  end

  def restaurant_name #custom attribute writer to nested form for new review
    self.try(:restaurant).try(:name)
  end

  def restaurant_name=(name)
     self.restaurant = Restaurant.find_or_create_by(name: name)
  end

  def self.alphabetical_order #ActiveRecord method to alphabetize lists
    User.order(email: :asc)
    Review.order(restaurant_name: :asc)
  end

end
