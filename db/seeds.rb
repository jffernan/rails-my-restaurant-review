User.create!(email: "email@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  email = "email#{n+1}@gmail.com"
  password = "password"
  User.create!(email: email,
               password:              password,
               password_confirmation: password)
end
#'rake db:migrate:reset' to delete all users
