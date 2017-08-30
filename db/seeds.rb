Cuisine.create(name: 'Italian')
Cuisine.create(name: 'Greek')
Cuisine.create(name: 'Burgers')
Cuisine.create(name: 'Buffet')

5.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = Faker::Company.name
  content =  Faker::Lorem.sentence
  cuisine_ids = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  cuisine_name = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  cuisine = "Burgers"
  date_visited = Faker::Date.backward(185)
  rating = ["Excellent", "Good", "Average", "Poor"].sample

  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                date_visited: date_visited,
                rating: rating)
end

5.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = Faker::Company.name
  content =  Faker::Lorem.sentence
  cuisine_ids = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  #cuisine = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  cuisine = "Pizza"
  date_visited = Faker::Date.backward(185)
  rating = ["Excellent", "Good", "Average", "Poor"].sample

  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                date_visited: date_visited,
                rating: rating)
end

5.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = Faker::Company.name
  content =  Faker::Lorem.sentence
  cuisine_ids = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  #cuisine = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  cuisine = "Deli"
  date_visited = Faker::Date.backward(185)
  rating = ["Excellent", "Good", "Average", "Poor"].sample

  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                date_visited: date_visited,
                rating: rating)
end

5.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = Faker::Company.name
  content =  Faker::Lorem.sentence
  cuisine_ids = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  #cuisine = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  cuisine = "Upscale"
  date_visited = Faker::Date.backward(185)
  rating = ["Excellent", "Good", "Average", "Poor"].sample

  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                date_visited: date_visited,
                rating: rating)
end

5.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = Faker::Company.name
  content =  Faker::Lorem.sentence
  cuisine_ids = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  #cuisine = ["Upscale", "American", "Fast Food", "Chinese", "Mexican", "Steak"].sample
  cuisine = "Teriyaki"
  date_visited = Faker::Date.backward(185)
  rating = ["Excellent", "Good", "Average", "Poor"].sample

  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                date_visited: date_visited,
                rating: rating)
end
