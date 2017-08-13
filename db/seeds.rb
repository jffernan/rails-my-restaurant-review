#User.create!(email: Faker::Internet.email,
             #password:              "password",
             #password_confirmation: "password")

20.times do |n|
  User.create!(email: Faker::Internet.email,
               password:              "password",
               password_confirmation: "password")
end

5.times do
  Review.create!(user: users.sample,
                restaurant_name: Faker::Company.name,
                content: Faker::Lorem.sentence,
                cuisine: Faker::Lorem.word,
                rating: "Excellent",
                review_date: 08/01/2017
  )
end

5.times do
  Review.create!(user: users.sample,
                restaurant_name: Faker::Company.name,
                content: Faker::Lorem.sentence,
                cuisine: Faker::Lorem.word,
                rating: "Good",
                review_date: 07/05/2017
  )
end

5.times do
  Review.create!(user: users.sample,
                restaurant_name: Faker::Company.name,
                content: Faker::Lorem.sentence,
                cuisine: Faker::Lorem.word,
                rating: "Average",
                review_date: 06/15/2017
  )
end

5.times do
  Review.create!(user: users.sample,
                restaurant_name: Faker::Company.name,
                content: Faker::Lorem.sentence,
                cuisine: Faker::Lorem.word,
                rating: "Poor",
                review_date: 08/10/2017
  )
end

10.times do |n|
  User.create!(email: Faker::Internet.email,
               password:              "password",
               password_confirmation: "password")

   4.times do
     Review.create!(user: users.sample,
                   restaurant_name: Faker::Company.name,
                   content: Faker::Lorem.sentence,
                   cuisine: Faker::Lorem.word,
                   rating: "Excellent",
                   review_date: 08/01/2017
     )
   end

   3.times do
     Review.create!(user: users.sample,
                   restaurant_name: Faker::Company.name,
                   content: Faker::Lorem.sentence,
                   cuisine: Faker::Lorem.word,
                   rating: "Good",
                   review_date: 07/05/2017
     )
   end

   4.times do
     Review.create!(user: users.sample,
                   restaurant_name: Faker::Company.name,
                   content: Faker::Lorem.sentence,
                   cuisine: Faker::Lorem.word,
                   rating: "Average",
                   review_date: 06/15/2017
     )
   end

   3.times do
     Review.create!(user: users.sample,
                   restaurant_name: Faker::Company.name,
                   content: Faker::Lorem.sentence,
                   cuisine: Faker::Lorem.word,
                   rating: "Poor",
                   review_date: 08/10/2017
     )
   end
end
#'rake db:migrate:reset' to delete all users
