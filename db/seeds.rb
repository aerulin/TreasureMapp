# Clear database
require 'faker'

# puts 'Deleting users'
# User.all.destroy
# puts 'Deleting challenges'
# Challenge.all.destroy
# puts 'deleting '
# Question.all.delete
# puts 'clues '
# Clue.all.delete
# puts 'Deleting missions'
# Mission.all.destroy


10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  nickname = "#{first_name[0]}#{last_name}"
  email = "#{first_name}@gmail.com"
User.create(
  first_name: first_name ,
  last_name: last_name,
  nickname: nickname,
  city: ["Lausanne", "Lausanne","Renens", "Geneva", "Zurich","Prilly","Ecublens","Crissier","Bussigny"].sample,
  encrypted_password: email,
  password: first_name,
)
end
