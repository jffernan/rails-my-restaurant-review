25.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = Faker::Company.name
  content =  Faker::Lorem.sentence
  cuisine_name = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak", "Pizza", "Deli", "Burgers"].sample
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
