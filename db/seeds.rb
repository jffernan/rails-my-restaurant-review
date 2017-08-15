5.times do |n|
  email = Faker::Internet.unique.safe_email
  password = "password"
  password_confirmation = "password"
  user = User.create!(email:                 email,
               password:              password,
               password_confirmation: password)
  restaurant_name = Faker::Company.name
  content =  Faker::Lorem.sentence
  date_visited = Time.now.strftime("%m/%d/%Y")
  #creator = User.offset(rand(User.count)).first
  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                cuisine: "Fast Food"
                rating: "Average"
                date_visited: date_visited)

  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                cuisine: "Gourmet"
                rating: "Excellent"
                date_visited: date_visited)

  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                cuisine: "Organic"
                rating: "Good"
                date_visited: date_visited)

  Review.create!(user: user,
                restaurant_name: restaurant_name,
                content: content,
                cuisine: "Mexican"
                rating: "Poor"
                date_visited: date_visited)

end

Cuisine.create(name: 'American')
Cuisine.create(name: 'Fast Food')
Cuisine.create(name: 'Chinese')
Cuisine.create(name: 'Mexican')
Cuisine.create(name: 'Steak')
