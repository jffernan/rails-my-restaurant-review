20.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = Faker::Company.name
  content =  Faker::Lorem.sentence
  cuisine = Faker::Lorem.word
  rating = "Average"
  review_date = "08/12/2017"
  #creator = User.offset(rand(User.count)).first
  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                cuisine: cuisine,
                rating: rating,
                review_date: review_date)
end

Cuisine.create(name: 'American')
Cuisine.create(name: 'Fast Food')
Cuisine.create(name: 'Chinese')
Cuisine.create(name: 'Mexican')
Cuisine.create(name: 'Steak')
