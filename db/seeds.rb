# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Item.destroy_all
Suitcase.destroy_all
User.destroy_all
Suggestion.destroy_all

user1 = User.new(email: "charlotte@gmail.com", password: "chacha", first_name: "charlotte", last_name: "pichelot" )
user1.save
user2 = User.new(email: "mimi@gmail.com", password: "mimimi", first_name: "myriam", last_name: "dbs" )
user2.save
user3 = User.new(email: "antoine@gmail.com", password: "123456", first_name: "antoine", last_name: "rochon" )
user3.save
user4 = User.new(email: "brad@gmail.com", password: "braddfuji", first_name: "brad", last_name: "fuji" )
user4.save

suitcase1 = Suitcase.new(name:"Weekend à Londres", start_date:"12/06/2020", end_date:"14/06/2020", destination:"Londres", user:user1)
suitcase1.save
suitcase2 = Suitcase.new(name:"Semaine au ski", start_date:"12/02/2021", end_date:"19/02/2021", destination:"Les 2 Alpes", user:user1)
suitcase2.save
suitcase3 = Suitcase.new(name:"Vacances en Corse", start_date:"08/08/2020", end_date:"21/08/2020", destination:"Corse", user:user3)
suitcase3.save
suitcase4 = Suitcase.new(name:"Weekend à la campagne", start_date:"10/07/2020", end_date:"12/07/2020", destination:"Honfleur", user:user4)
suitcase4.save
file = URI.open('https://images.unsplash.com/photo-1565942791183-a8ff81b6732f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80')
suitcase5 = Suitcase.new(name:"Weekend à la campagne", start_date:"23/05/2020", end_date:"24/05/2020", destination:"Mézières-en-drouais", user:user2)
suitcase5.save
suitcase5.photo.attach(io: file, filename: 'campagne.png', content_type: 'image/png')

items = {
  "Maillot de bain" => ["Piscine", "Plage"],
  "Serviette" => ["Piscine", "Plage", "Fitness"],
  "Lunettes de soleil" => ["Plage", "Randonnée"],
  "Parasol" => ["Plage"],
  "Tongs" => ["Piscine", "Plage"],
  "Chapeau / Casquette" => ["Plage", "Randonnée"],
  "Crème solaire" => ["Randonnée", 'plage',"Sport d'hiver"],
  "Après-Soleil" => ["Plage", "Randonnée"],
  "Anti-moustique" => ["Randonnée"],
  "Gourde" => ["Randonnée", "Fitness"],
  "Chaussures de running" => ["Fitness"],
  "Chaussures de marche" => ["Randonnée"],
  "Kit de secours" => ["Randonnée"],
  "Batterie portable externe" => ["Randonnée"],
  "Sac à dos" => ["Randonnée"],
  "Après-ski" => ["Sport d'hiver"],
  "Baume à lèvre" => ["Sport d'hiver"],
  "Bonnet" => ["Sport d'hiver"],
  "Casque" => ["Sport d'hiver"],
  "Echarpe" => ["Sport d'hiver"],
  "Masque de ski" => ["Sport d'hiver"],
  "Gants" => ["Sport d'hiver", "Randonnée"],
  "Appareil Photo" => ["Photo"],
  "Chargeur d'appareil photo" => ["Photo"],
  "Objectifs" => ["Photo"],
  "Trépied" => ["Photo"],
  "Cartes mémoire" => ["Photo"],
  "Sac d'appareil photo" => ["Photo"],
}

items.each do |item, interests|
  suggestion = Suggestion.create!(name: item)
  suggestion.interest_list.add(interests)
  suggestion.save!
end

item1 = Item.new(name:"Brosse à dents", suitcase:suitcase1)
item1.save
item2 = Item.new(name:"Dentifrice", suitcase:suitcase2)
item2.save
item3 = Item.new(name:"Ceinture", suitcase:suitcase3)
item3.save
item4 = Item.new(name:"T-shirt", suitcase:suitcase4)
item4.save
