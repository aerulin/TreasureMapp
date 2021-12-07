require 'faker'
require 'open-uri'

# Photos link ####################################################
photo_array = [
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1638441052/01-geneva_yafpqo.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1638441053/02-parc-sauvabelin_w1oqk2.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1638442447/12-rhone-geneve_pb6wzg.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1638441052/08-yverdon_x3kx0o.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1638441052/03-zurich_too6lp.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1638442446/13-bale-rhin_ndz1hr.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1638441052/11-yverdon-plage_ash4aa.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1638441052/05-montreux_sq2oai.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1638441052/06-fribourg_bxnm2z.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1638441052/04-lausanne-ville_y6maru.jpg',
]

people_photo_array = [
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1637919368/hamilton_ykiivz.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1637919368/macron_sefgml.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1637846119/surchat_vcwej2.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1637845901/patrick_cwkajv.jpg',
  'https://res.cloudinary.com/dg2an4buq/image/upload/v1637845642/jacques_xya10w.jpg',
]

# Mission name ####################################################
mission_array = [
  'Gêne-Ève',
  'Passe la Bâle',
  'Sur le (t)Rhone',
  'Nous Yverdons',
  'Flow Zürichois',
  'Rhin océros',
  'Hiver dont plage',
  'Lémanger la perche',
  'Bourge frit',
  'Ô lain pique'
]

city_array = [
  'Genève',
  'Bâle',
  'Genève',
  'Yverdon-les-Bains',
  'Zürich',
  'Bâle',
  'Yverdon-les-Bains',
  'Montreux',
  'Fribourg',
  'Lausanne'
]

description_array = [
  "A la conquête de la ville de Calvin. Attention à ne pas prendre une martmite sur la tête.",
  "Capitale culturelle, ville des amoureux, une petite escapade romantique.",
  "Des montagnes à la Mer Méditerranée, laissez vous porter par le courant.",
  "As de la grammaire et la conjugaison ? Sauras-tu Yverder ?",
  "Patrimoine mondiale de la Gastronomie ? Pas du tout, mais c'est bon quand même",
  "Ambiance tropicale l'été, Lac Baikal l'hiver. Tu veux faire un plouf ?",
  "Sous les pavés la plage ! Un mois de mai à Yverdon.",
  "Souvent trop cher, presque toujours de Pologne, la perche fait débat.",
  "C'est gras, c'est bon, c'est le Fribourgeon.",
  "Le pull qui gratte, les dents qui claquent. Ça donne envie ?"
]

nickname_array = %w[tibo-gem-pa matil-de.france lapin-kentin manu_militari c_la_cataline m-organic riz.laine colin_maillard g_pa_didier boris-tourne]

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

puts 'Creating 10 users....'
p = 0
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name.downcase}.#{last_name.downcase}@gmail.com"
  user = User.new(
    first_name: first_name,
    last_name: last_name,
    nickname: nickname_array[p],
    city: ["Lausanne", "Lausanne", "Renens", "Geneva", "Zurich", "Prilly", "Ecublens", "Crissier", "Bussigny"].sample,
    password: '123456',
    email: email
  )
  # user.photo.attach(
  #   io: URI.open(people_photo_array.sample),
  #   filename: "user#{p}.png",
  #   content_type: 'image/png'
  # )
  user.save!
  p += 1
end

puts 'Users created'

# Creating mission ###########################################

ouchy_url = 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Girouette_d_ouchy_lausanne_suisse.jpg'
sauvabelin_url = 'https://cdn.loisirs.ch/media/cache/default_og_image/default/0001/14/13725_default_og_image.jpg'
wagon_url = 'https://d2r9nfiii89r0l.cloudfront.net/dimg/800x600/dimg/romain_paillard_boris_paillard_sebastien_saunier_-_le_wagon.jpg'

puts "create Ouch'y mission"
ouchy = Mission.new(
  name: "Ouch'y",
  secret_place: "Tour Haldimand",
  category: "Quartier",
  difficulty: "Moyen",
  time: "1h30",
  city: 'Lausanne',
  lat: 46.505073,
  lng: 6.641532,
  description: "Partez à la découverte du quartier d'Ouchy, ses quais, le lac, ses bâtiments, ses jardins et son art.",
  photo_url: ouchy_url
)
ouchy.save!

puts "Laus'Angeles"
sauvabelin = Mission.new(
  name: "Laus' Angeles",
  secret_place: "Tour de Sauvablin",
  category: "Parc",
  difficulty: "Facile",
  time: "2h00",
  city: 'Lausanne',
  lat: 46.535237,
  lng: 6.638511,
  description: "Lausanne, ville de verdure, de parcs, et de forêts. La mission vous emmenera aux confins de la ville",
  photo_url: sauvabelin_url
)
sauvabelin.save!

puts "Borissolé"
wagon = Mission.new(
  name: "Borissolé",
  secret_place: "Le Wagon",
  category: "Célébrité",
  difficulty: "Difficile",
  time: "0h45",
  city: 'Lausanne',
  lat: 46.53206308153252,
  lng: 6.59230929974131,
  description: "Maman j'ai raté Boris !",
  photo_url: wagon_url
)
wagon.save!

puts "Create other mission"
i = 0
10.times do
  Mission.create(
    name: mission_array[i],
    photo_url: photo_array[i],
    difficulty: ['Facile', 'Moyen', 'Difficile'].sample,
    city: city_array[i],
    time: "#{rand(0..2)}h#{rand(0...6)}0",
    category: ['Quartier', 'Parc', 'Célébrité', 'Histoire', 'Art'].sample,
    description: description_array[i]
  )
  i += 1
end

# Creating clues ###########################################

puts "Creating clues Ouchy"
Clue.create(mission: ouchy, level: 1, description: "Mon créateur était d'origine britannique")
Clue.create(mission: ouchy, level: 2, description: "J'aurais gagné un concours d'élégance au XIXeme siècle")
Clue.create(mission: ouchy, level: 3, description: "J'ai manqué de mourir étouffée par la flore")
Clue.create(mission: ouchy, level: 4, description: "J'ai une petite soeur au parc de Mon-Repos")
Clue.create(mission: ouchy, level: 5, description: "Je me trouve à l'embouchure de la Vuachère")

puts "Creating clues Sauvabelin"
Clue.create(mission: sauvabelin, level: 1, description: "J'ai été imaginée à l'EPFL")
Clue.create(mission: sauvabelin, level: 2, description: "Je pèse la bagatelle de 130 tonnes")
Clue.create(mission: sauvabelin, level: 3, description: "Le Douglas est mon élément principal")
Clue.create(mission: sauvabelin, level: 4, description: "J'ai vu le jour grâce à la générosité de nombreuses familles")
Clue.create(mission: sauvabelin, level: 5, description: "Je culmine à 35m de hauteur")

puts "Creating clues Wagon"
Clue.create(mission: wagon, level: 1, description: "J'ai des roues mais ne bouge")
Clue.create(mission: wagon, level: 3, description: "Un de mes professeurs est champion de Suisse")
Clue.create(mission: wagon, level: 2, description: "Je suis animé par les perceuses et la ventilation")
Clue.create(mission: wagon, level: 4, description: "Mon créateur s'est (auto) divinisé")
Clue.create(mission: wagon, level: 5, description: "Chaque jour vous y sentirez son regard")

# Creating question OUCHY ###########################################

puts "Creating questions Ouchy"
ouchy_q_1 = Question.create(
  mission: ouchy,
  lat: 46.507945,
  lng: 6.633765,
  question: "Quel symbole caché montre la statue des cyclistes au parc olympique ?",
  answer: "symbole olympique",
  validation: ["symbole", "olympique"]
)

ouchy_q_2 = Question.create(
  mission: ouchy,
  lat: 46.507037,
  lng: 6.626361,
  question: "En quelle année commence la construction du funiculaire d'Ouchy ?",
  answer: "1874",
  validation: ["1874"]
)

ouchy_q_3 = Question.create(
  mission: ouchy,
  lat: 46.506835,
  lng: 6.625198,
  question: "Quelle information nous donne Eole ?",
  answer: "le type de vent",
  validation: ["vent"]
)

ouchy_q_4 = Question.create(
  mission: ouchy,
  lat: 46.506170,
  lng: 6.640920,
  question: "Qui a offert le Temple Pagode Thaï à la ville de Lausanne ?",
  answer: "le souverain du Siam",
  validation: ["roi", "souverain", "regent", "siam"]
)

ouchy_q_5 = Question.create(
  mission: ouchy,
  lat: 46.504766,
  lng: 6.625691,
  question: "Combien y a t-il de pointes sur la sculputure Ouverture au monde ?",
  answer: "36",
  validation: ["36"]
)

# Creating question SAUVABELIN ###########################################

puts "Creating questions Sauvabelin"

sauvabelin_q_1 = Question.create(
  mission: sauvabelin,
  lat: 46.537141,
  lng: 6.638888,
  question: "En quelle année s'achève la restauration des berges du lac de Sauvabelin ?",
  answer: "2017",
  validation: ["2017"]
)

sauvabelin_q_2 = Question.create(
  mission: sauvabelin,
  lat: 46.530815,
  lng: 6.637631,
  question: "Combien de juges siègent au tribunal cantonal ?",
  answer:"44",
  validation: ["44"]
)

sauvabelin_q_3 = Question.create(
  mission: sauvabelin,
  lat: 46.530675,
  lng: 6.639757,
  question: "Quelle est la plus haute montagne visible depuis ce lieu ?",
  answer: "Mont-blanc",
  validation: ["blanc", "mont blanc", "mont-blanc"]
)

sauvabelin_q_4 = Question.create(
  mission: sauvabelin,
  lat: 46.530210,
  lng: 6.640047,
  question: "Que peut-on voir au fond de la grotte ?",
  answer: "un Ours",
  validation: ["ours"]
)

sauvabelin_q_5 = Question.create(
  mission: sauvabelin,
  lat: 46.528084,
  lng: 6.637235,
  question: "En quelle année est donnée à la ville de Lausanne la maison du parc de l'Hermitage ?",
  answer: "1976",
  validation: ["1976"]
)

# Creating question LEWAGON ###########################################

wagon_q_1 = Question.create(
  mission: wagon,
  lat: 46.532244761648016,
  lng: 6.592130283832927,
  question: "En quelle année le grand Manitou a-t'il créé le Wagon ?",
  answer: "2013",
  validation: ["2013"]
)

wagon_q_2 = Question.create(
  mission: wagon,
  lat: 46.538932134735624,
  lng: 6.58087239703863,
  question: "Quel est le menu traditionel du mercredi pour le déjeuner ? (à midi Alain)",
  answer: "Burger King",
  validation: ["Burger", "King"]
)

wagon_q_3 = Question.create(
  mission: wagon,
  lat: 46.52762794320534,
  lng: 6.598606890506459,
  question: "Quelle entreprise a ses bureaux en ce lieu ?",
  answer: "Wavemind",
  validation: ["Wavemind", "Alain", "Wave", "Mind"]
)

wagon_q_4 = Question.create(
  mission: wagon,
  lat: 46.529013775170206,
  lng: 6.600066406327933,
  question: "Quel sport notre champion de Suisse ne pratique pas ?",
  answer: "Hockey sur glace",
  validation: ["Hockey", "Glace"]
)

wagon_q_5 = Question.create(
  mission: wagon,
  lat: 46.53684395622203,
  lng: 6.57869737307225,
  question: "Quel est le point de départ de la course de Trotinette electrique ?",
  answer: "la Gare de Renens",
  validation: ["Gare", "CFF", "Renens"]
)


# Creating random challenges ###########################################

puts "Creating challenges"

User.all.each do |user|
  Challenge.create(
    user: user,
    mission: Mission.all.sample,
    status: [true, false, false].sample,
    secret_counter: rand(3),
    score: rand(1000..3000)
  )
end

# Creating Alain et Sinan ###########################################

puts 'Creating Sinan...'

sinan = User.new(
  first_name: 'Sinan',
  last_name: 'Otech',
  nickname: 'sinananas',
  city: "Lausanne",
  password: '123456',
  email: 'sinan@gmail.com',
)
sinan.photo.attach(
  io: URI.open('https://res.cloudinary.com/dg2an4buq/image/upload/v1638797470/sinan-portrait-SITE_nhsfld.png'),
  filename: "sinan.png",
  content_type: 'image/png'
)
sinan.save!
puts 'Sinan created'

puts 'Creating Alein...'

alain = User.new(
  first_name: 'Alain',
  last_name: 'Travers',
  nickname: 'alun_2_3_partez',
  city: "Lausanne",
  password: '123456',
  email: 'alain@gmail.com',
)
alain.photo.attach(
  io: URI.open('https://izar.ae/wp-content/uploads/2018/02/51511-01-2_edited.jpg'),
  filename: "alain.jpg",
  content_type: 'image/jpg'
)
alain.save!
puts 'Alein created'

# Creating Sinan ended challenge ###########################################

puts "Creating Sinan's ended challenges"

i = 1
4.times do
  challenge = Challenge.new(
    user: sinan,
    mission: Mission.find_by(name: mission_array[i]),
    status: true,
    secret_counter: rand(3),
  )
  rand(4..7).times do
    ChallengeQuestion.create(
      challenge: challenge,
      question: Question.all.sample,
      status: true,
      answer_counter: rand(1..3),
    )
  end
  challenge.score = challenge.calculate_score[:final_score]
  challenge.save
  i += 1
end

# Setup Sinan Ouchy Challenge ###########################################

# ouchy_challenge = Challenge.create(
#   user: sinan,
#   mission: ouchy,
#   status: false,
#   secret_counter: 0,
# )

# ChallengeQuestion.create(
#   challenge: ouchy_challenge,
#   question: ouchy_q_1,
#   status: true,
#   answer_counter: 2
# )

# ChallengeQuestion.create(
#   challenge: ouchy_challenge,
#   question: ouchy_q_2,
#   status: false,
#   answer_counter: 1
# )

# ChallengeQuestion.create(
#   challenge: ouchy_challenge,
#   question: ouchy_q_3,
#   status: true,
#   answer_counter: 4
# )

# Setup Sinan Sauvabelin Challenge ###########################################

sauvabelin_challenge = Challenge.create(
  user: sinan,
  mission: sauvabelin,
  status: false,
  secret_counter: 0,
)

ChallengeQuestion.create(
  challenge: sauvabelin_challenge,
  question: sauvabelin_q_1,
  status: true,
  answer_counter: 4
)

ChallengeQuestion.create(
  challenge: sauvabelin_challenge,
  question: sauvabelin_q_2,
  status: false,
  answer_counter: 2
)

ChallengeQuestion.create(
  challenge: sauvabelin_challenge,
  question: sauvabelin_q_3,
  status: true,
  answer_counter: 2
)

ChallengeQuestion.create(
  challenge: sauvabelin_challenge,
  question: sauvabelin_q_4,
  status: false,
  answer_counter: 1
)

# Setup Sinan Wagon Challenge ###########################################

wagon_challenge = Challenge.create(
  user: sinan,
  mission: wagon,
  status: false,
  secret_counter: 0,
)

ChallengeQuestion.create(
  challenge: wagon_challenge,
  question: wagon_q_1,
  status: false,
  answer_counter: 1
)

ChallengeQuestion.create(
  challenge: wagon_challenge,
  question: wagon_q_2,
  status: true,
  answer_counter: 3
)

ChallengeQuestion.create(
  challenge: wagon_challenge,
  question: wagon_q_3,
  status: false,
  answer_counter: 0
)

ChallengeQuestion.create(
  challenge: wagon_challenge,
  question: wagon_q_4,
  status: true,
  answer_counter: 2
)

ChallengeQuestion.create(
  challenge: wagon_challenge,
  question: wagon_q_5,
  status: true,
  answer_counter: 2
)

puts "------------------------------------------------------------------"
puts "----------------Seed working correctly. Enjoy !-------------------"
puts "------------------------------------------------------------------"
