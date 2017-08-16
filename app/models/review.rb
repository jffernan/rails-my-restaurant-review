class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :review_cuisines
  has_many :cuisines, through: :review_cuisines

  validates_presence_of :restaurant_name, :date_visited, :rating

  validates :content, presence: true, length: { minimum: 10 }

  def restaurant_name #custom attribute writer to nested form for new review
    self.restaurant.name if self.restaurant
  end

  def restaurant_name=(name)
     self.restaurant = Restaurant.find_or_create_by(name: name)
  end

  def cuisines_attributes=(cuisine_attributes) #custom attribute writer: cuisine
    cuisine_attributes.values.each do |cuisine_attribute|
      cuisine = Cuisine.find_or_create_by(cuisine_attribute)#avoid duplicate cuisines
      self.cuisines << cuisine
    end
  end

  def self.order_by_date
    Review.order(date_visited: :desc) #ActiveRecord method to order by most recent date
  end

  def self.top_reviews #class level ActiveRecord scope method for top reviews
    where(rating: 'Excellent') #top reviews = reviews with Excellent rating
  end

end
