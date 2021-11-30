require 'faker'
# require 'open-uri'


# Clear database ####################################################

puts 'Deleting users'
User.all.destroy_all

puts 'Deleting challenges'
Challenge.all.destroy_all

puts 'deleting questions '
Question.all.destroy_all

puts 'deleting Challenge-questions '
ChallengeQuestion.all.destroy_all

puts 'Deleting clues '
Clue.all.destroy_all

puts 'Deleting mission'
Mission.all.destroy_all

# Creating users ####################################################

puts 'Creating Sinan...'
sinan = User.new(
  first_name: 'Sinan',
  last_name: 'Lartiste',
  nickname: 'slartiste',
  city: "Lausanne",
  password: '123456',
  email: 'sinan@gmail.com'
)
sinan.save!
puts 'Sinan created'

puts 'Creating 10 users....'
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  nickname = "#{first_name[0]}#{last_name}"
  email = "#{first_name}.#{last_name}@gmail.com"
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    nickname: nickname,
    city: ["Lausanne", "Lausanne", "Renens", "Geneva", "Zurich", "Prilly", "Ecublens", "Crissier", "Bussigny"].sample,
    password: '123456',
    email: email
  )
  user.save!
end

puts 'Users created'


# Creating mission ###########################################

photo_url = 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Girouette_d_ouchy_lausanne_suisse.jpg'

puts "create Ouch'y mission"
mission = Mission.new(
  name: "Ouch'y",
  secret_place: "Tour Haldimand",
  category: "Quartier",
  difficulty: "Medium",
  time: "1h30",
  lat: 46.505073,
  lng: 6.641532,
  photo_url: photo_url
)
mission.save!
puts "Create other mission"

20.times do
  Mission.create(name: Faker::WorldCup.stadium, photo_url: 'https://picsum.photos/300/300')
end

# Creating clues ###########################################

puts "Creating clues"
Clue.create(mission: mission, level: 1, description: "Mon créateur était d'origine britanique")
Clue.create(mission: mission, level: 2, description: "J'aurai gagné un concours d'élégance au XIXeme siècle")
Clue.create(mission: mission, level: 3, description: "J'ai manqué de mourir étouffée par la flore")
Clue.create(mission: mission, level: 4, description: "J'ai une petite soeur au parc de Mon-Repos")
Clue.create(mission: mission, level: 5, description: "Je me trouve à l'embouchure de la Vuachère")

# Creating question ###########################################

# Question.create(mission: mission, lat: , lng: , question: "", answer:"")
