class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates_presence_of :cuisine, :rating, :review_date
  validates :content, presence: true, length: { minimum: 10 }
  
  def restaurant_name
    self.restaurant.name #class method to access restaurant name
  end

  #def user_email
    #self.user.email #class method to access user email
  #end

  def self.alphabetical_order #ActiveRecord method to alphabetize lists
    Review.order(rest_name: :asc) #Alphabetize by Restaurant name
  end

end
