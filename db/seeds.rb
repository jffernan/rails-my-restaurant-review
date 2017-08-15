20.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = Faker::Company.name
  content =  Faker::Lorem.sentence
  cuisine = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  date_visited = Faker::Date.backward(185)
  rating = ["Excellent", "Good", "Average", "Poor"].sample

  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                cuisine: cuisine,
                date_visited: date_visited,
                rating: rating)
end

Cuisine.create(name: 'American')
Cuisine.create(name: 'Fast Food')
Cuisine.create(name: 'Chinese')
Cuisine.create(name: 'Mexican')
Cuisine.create(name: 'Steak')

Review.create(date_visited: '08/15/2017')
