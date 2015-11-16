# users
# User.create username: "mctaylorpants", email: "alexmctaylorpants@gmail.com", password: "password"
#
# 20.times do
#   username = Faker::Internet.user_name
#   email = Faker::Internet.email
#   password = "password"
#   User.create username: username, email: email, password: password
# end

50.times do
  title = Faker::Company.bs
  description = Faker::Lorem.paragraph
  user = User.all.sample
  Idea.create title: title, description: description, user: user
end
