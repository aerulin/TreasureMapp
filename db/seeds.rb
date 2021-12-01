require 'faker'
# require 'open-uri'


# Clear database ####################################################

puts 'Deleting users'
User.all.destroy_all

puts 'Deleting challenges'
Challenge.all.destroy_all

puts 'deleting questions '
Question.all.destroy_all

puts 'Deleting clues '
Clue.all.destroy_all

puts 'Deleting mission'
Mission.all.destroy_all

# Creating users ####################################################

puts 'Creating Sinan...'
sinan = User.new(
  first_name: 'Sinan' ,
  last_name: 'Lartiste',
  nickname: 'slartiste',
  city: "Lausanne",
  password: '123456',
  email: 'sinan@gmail.com',
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
  first_name: first_name ,
  last_name: last_name,
  nickname: nickname,
  city: ["Lausanne", "Lausanne","Renens", "Geneva", "Zurich","Prilly","Ecublens","Crissier","Bussigny"].sample,
  password: '123456',
  email: email,
)
user.save!
end

puts 'Users created'


# Creating mission ###########################################

ouchy_url = 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Girouette_d_ouchy_lausanne_suisse.jpg'
sauvabelin_url = 'https://cdn.loisirs.ch/media/cache/default_og_image/default/0001/14/13725_default_og_image.jpg'

puts "create Ouch'y mission"
ouchy = Mission.new(
  name: "Ouch'y",
  secret_place: "Tour Haldimand",
  category: "Quartier",
  difficulty: "Intermédiaire",
  time: "1h30",
  lat: 46.505073,
  lng: 6.641532,
  description: "Partez à la découverte du quartier d'Ouchy, ses quais, le lac, ses batiments, ses jardins et son art. En avant pour une folle aventure !",
  photo_url: ouchy_url,
)
ouchy.save!

puts "Laus'Angeles"
sauvabelin = Mission.new(
  name: "Laus' Angeles",
  secret_place: "Tour de Sauvablin",
  category: "Parc",
  difficulty: "Facile",
  time: "2h00",
  lat: 46.535237,
  lng: 6.638511,
  description: "Lausanne, ville de verdure de parc et de forêt. La mission vous emmenera à la limite de la ville, là où la nature a tous ses droits.",
  photo_url: sauvabelin_url,
)
sauvabelin.save!

puts "Create other mission"

20.times do
  Mission.create(
    name: Faker::WorldCup.stadium,
    photo_url: 'https://picsum.photos/300/300',
    difficulty: ['Facile', 'Moyen', 'Difficile'].sample,
    time: "#{rand(0..2)}h#{rand(0...6)}0",
    category: ['Quartier', 'Parc', 'Célébrité', 'Histoire', 'Art'].sample,
    description: Faker::Lorem.sentence(word_count: 5, supplemental: true, random_words_to_add: 4),
  )
end

# Creating clues ###########################################

puts "Creating clues Ouchy"
Clue.create(mission: ouchy, level: 1, description: "Mon créateur était d'origine britanique")
Clue.create(mission: ouchy, level: 2, description: "J'aurai gagné un concours d'élégance au XIXeme siècle")
Clue.create(mission: ouchy, level: 3, description: "J'ai manqué de mourir étouffée par la flore")
Clue.create(mission: ouchy, level: 4, description: "J'ai une petite soeur au parc de Mon-Repos")
Clue.create(mission: ouchy, level: 5, description: "Je me trouve à l'embouchure de la Vuachère")

puts "Creating clues Sauvabelin"
Clue.create(mission: sauvabelin, level: 1, description: "J'ai été imaginée à l'EPFL")
Clue.create(mission: sauvabelin, level: 2, description: "Je pèse la bagatelle de 130 tonnes")
Clue.create(mission: sauvabelin, level: 3, description: "Le Douglas est mon élément principal")
Clue.create(mission: sauvabelin, level: 4, description: "J'ai vu le jour grâce à la générosité de nombreuses familles")
Clue.create(mission: sauvabelin, level: 5, description: "Je culmine à 35m de hauteur")

# Creating question ###########################################

puts "Creating questions Ouchy"
Question.create(mission: ouchy, lat: 46.507945, lng: 6.633765, question: "Quel symbole caché montre la statue des cyclistes au parc olympique", answer:"symbole olympique")
Question.create(mission: ouchy, lat: 46.507037, lng: 6.626361, question: "A quelle année commence la construction du funiculaire d'Ouchy", answer:"1874")
Question.create(mission: ouchy, lat: 46.506835, lng: 6.625198, question: "Quelle information nous donne Eole ?", answer:"le type de vent")
Question.create(mission: ouchy, lat: 46.506170, lng: 6.640920, question: "Qui a offert le Temple Pagode Thaï à la ville de Lausanne ?", answer:"le souverain du Siam")
Question.create(mission: ouchy, lat: 46.504766, lng: 6.625691, question: "Combien y a t-il de pointe sur la sculputure Ouverture au monde ?", answer:"36")

puts "Creating questions Sauvabelin"
Question.create(mission: sauvabelin, lat: 46.537141, lng: 6.638888, question: "En quelle année s'achève la restauration des berges du lac de Sauvabelin", answer:"2017")
Question.create(mission: sauvabelin, lat: 46.530815, lng: 6.637631, question: "Combien de juges siègent au tribunal cantonnal", answer:"44")
Question.create(mission: sauvabelin, lat: 46.530675, lng: 6.639757, question: "Quelle est la plus haute montagne visible depuis ce lieu ?", answer:"Mont-blanc")
Question.create(mission: sauvabelin, lat: 46.530210, lng: 6.640047, question: "Que peut-on voir au fond de la grotte ?'", answer:"un Ours")
Question.create(mission: sauvabelin, lat: 46.528084, lng: 6.637235, question: "En quelle année est donnée, à la ville de Lausanne, la maison du parc de l'Hermitage ?", answer:"1976")


# Creating challenges ###########################################

puts "Creating Sinan's challenges"

3.times do
  Challenge.create(
    user: sinan,
    mission: Mission.all.sample,
    status: ["started", "finished"].sample,
    secret_counter: rand(3),
    score: rand(200..600)
  )
end

puts "Creating challenges"

20.times do
  Challenge.create(
    user: User.all.sample,
    mission: Mission.all.sample,
    status: ["started", "started", "finished"].sample,
    secret_counter: rand(3),
    score: rand(100..2000)
  )
end

puts "------------------------------------------------------------------"
puts "----------------Seed working correctly. Enjoy !-------------------"
puts "------------------------------------------------------------------"
