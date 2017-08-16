class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def self.alphabetical_order #ActiveRecord method to alphabetize lists
    Restaurant.order(:name) #Alphabetize by Restaurant name
  end

end
