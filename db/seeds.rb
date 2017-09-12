20.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = Faker::Company.name
  content =  Faker::Lorem.paragraph(3, true, 3)
  cuisine_name = ["Chinese", "Mexican", "Steak", "Pizza", "American", "Italian"].sample
  review_cuisine = Cuisine.find_or_create_by :name => cuisine_name
  date_visited = Faker::Date.backward(125)
  rating = ["Excellent", "Good", "Average", "Poor"].sample
  Review.create!(user: user,
                :cuisines => [review_cuisine],
                restaurant_name: restaurant_name,
                content: content,
                date_visited: date_visited,
                rating: rating)
end

10.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = ["McDonalds", "Burger King", "Wendy's", "Jack In The Box", "Subway", "Arby's"].sample
  content =  Faker::Lorem.paragraph(3, true, 3)
  cuisine_name = ["Burgers", "Sandwiches", "Fast Food"].sample
  review_cuisine = Cuisine.find_or_create_by :name => cuisine_name
  date_visited = Faker::Date.backward(90)
  rating = ["Excellent", "Good", "Average", "Poor"].sample
    3.times do |n|
    Review.create!(user: user,
                :cuisines => [review_cuisine],
                restaurant_name: restaurant_name,
                content: content,
                date_visited: date_visited,
                rating: rating)
    end
end
