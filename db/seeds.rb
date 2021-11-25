# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "begin seeding"
Order.destroy_all
Item.destroy_all
Shop.destroy_all
PointOfInterest.destroy_all
Message.destroy_all
Chatroom.destroy_all

address = ["16, Vla Gaudelet, 75011 Paris", "1, Vla Gaudelet, 75011 Paris", "79 Av. de la République, 75011 Paris", "72 Av. de la République, 75011 Paris", "67 Av. de la République, 75011 Paris", "12bis Vla Gaudelet, 75011 Paris", "84 Av. de la République, 75011 Paris", "106 Rue Oberkampf, 75011 Paris", "110 Rue Oberkampf, 75011 Paris" , "75 Av. de la République, 75011 Paris", "66 Av. de la République, 75011 Paris" ]
name = ["Kentucky fried Chicken", "Secret bar", "bar num 2", "Main restaurant", "clothes and more", "goodies store", "main merchandise store", "tacos bar", "take away bar and restaurant", "Pizza Yolo", "makdo", "kcf", "BK", "Pizza Hutte", "Food trucky", "cheezi truck"]
price = rand(5...20)
itemName = ["fries", "shoes", "goodies", "burger", "t-shirt", "bag", "shots", "red wine", "white wine", "beer", "souvenir", "hot dog", "sausage"]
desc = ["best ever", "good looking", "tasty", "get drunk fast", "try it because a description would not describe it"]
pointName = ["toilette 1", "toilette 2", "scene 1", "scene 2", "ATM", "exit", "entry"]
pointDesc = ["Main", "Second"]
pointAddress = ["26 Av. Jean Aicard, 75011 Paris", "30 Av. Jean Aicard, 75011 Paris", "1 Vla Gaudelet, 75011 Paris", "7 Vla Gaudelet, 75011 Paris", "115 Rue Oberkampf, 75011 Paris","120 Rue Oberkampf, 75011 Paris", "15 Av. Jean Aicard, 75011 Paris", "19 Av. Jean Aicard, 75011 Paris", "71 Rue Servan, 75011 Paris", "69 Rue Servan, 75011 Paris", "3 Rue Saint-Hubert, 75011 Paris", "9 Rue Saint-Hubert, 75011 Paris", "78 Rue Saint-Maur, 75011 Paris", "96 Rue Saint-Maur, 75011 Paris", "68 Av. de la République, 75011 Paris", "78 Av. de la République, 75011 Paris", "53 Av. de la République, 75011 Paris", "58 Av. de la République, 75011 Paris"]
7.times do
  shops = []
  shop = Shop.create!(
    name: name.sample,
    address: address.sample,
    festival_id: Festival.all.first.id
  )
  shops << shop
  shops.each do |shop|
    rand(5..10).times do
      item = Item.create!(
        name: itemName.sample,
        description: desc.sample,
        price: rand(5..20),
        shop_id: shop.id
      )
      shop.save!
      item.save!
    end
  end
end

10.times do
  point = PointOfInterest.create!(
    name: pointName.sample,
    description: pointDesc.sample ,
    address: pointAddress.sample,
    festival_id: Festival.all.first.id
  )
  point.save!
end
Chatroom.create!(
  name: "General",
  festival_id: Festival.all.first.id
)
Chatroom.create!(
  name: "Lost Items",
  festival_id: Festival.all.first.id
)
Chatroom.create!(
  name: "Track Id",
  festival_id: Festival.all.first.id
)
puts "seeding end"
