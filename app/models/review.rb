class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates_presence_of :cuisine, :rating, :review_date
  validates :content, presence: true, length: { minimum: 10 }

  def restaurant_name
    self.try(:restaurant).try(:name)
  end

  def restaurant_name=(name)
     self.restaurant = Restaurant.find_or_create_by(name: name)
  end

  #def user_email
    #self.user.email #class method to access user email
  #end

  def self.alphabetical_order #ActiveRecord method to alphabetize lists
    Review.order(restaurant_name: :asc) #Alphabetize by Restaurant name
  end

end
