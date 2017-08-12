class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates_presence_of :content, :rating

  def self.alphabetical_order #ActiveRecord method to alphabetize lists
    Review.order(rest_name: :asc) #Alphabetize by Restaurant name
  end

end
