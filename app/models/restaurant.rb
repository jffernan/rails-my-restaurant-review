class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :cuisines, through: :reviews

  validates :name, presence: true

  def restaurant_name
    self.restaurant.name if self.restaurant
  end

  def restaurant_name=(name)
     self.restaurant = Restaurant.find_or_create_by(name: name)
  end

  def self.alphabetical_order #ActiveRecord method to alphabetize list
    Restaurant.order(:name) #Alphabetize by Restaurant name
  end

end
