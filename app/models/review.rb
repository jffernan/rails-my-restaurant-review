class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :review_cuisines
  has_many :cuisines, through: :review_cuisines

  validates_presence_of :cuisine, :rating, :review_date
  validates :content, presence: true, length: { minimum: 10 }

  def restaurant_name #custom attribute writer to nested form for new review
    self.try(:restaurant).try(:name)
  end

  def restaurant_name=(name)
     self.restaurant = Restaurant.find_or_create_by(name: name)
  end

  def cuisines_attributes=(cuisine_attributes) #custom attribute writer: cuisine
    cuisine_attributes.values.each do |cuisine_attribute|
      cuisine = Cuisine.find_or_create_by(cuisine_attribute) #avoid duplicate cuisines
      self.cuisines << cuisine
    end
  end

  #def user_email
    #self.user.email #class method to access user email
  #end

  def self.alphabetical_order #ActiveRecord method to alphabetize lists
    Review.order(restaurant_name: :asc) #Alphabetize by Restaurant name
  end

  def self.top_reviews #class level ActiveRecord scope method for top reviews
    where(rating: 'Excellent') #top reviews = reviews with Excellent rating
  end

end
