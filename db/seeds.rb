# users
User.create username: "mctaylorpants", email: "alexmctaylorpants@gmail.com", password: "password"

20.times do
  username = Faker::Internet.user_name
  email = Faker::Internet.email
  password = "password"
  User.create username: username, email: email, password: password
end
