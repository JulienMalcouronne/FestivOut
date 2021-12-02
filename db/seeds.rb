# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
puts "begin seeding"

Order.destroy_all
Item.destroy_all
Shop.destroy_all
Reminder.destroy_all
Artist.destroy_all
PointOfInterest.destroy_all
Message.destroy_all
Day.destroy_all
Chatroom.destroy_all


nameday = ["Friday 3rd", "Saturday 4th", "Sunday 5th"]
time = ["03/12/2021 18:00", "03/12/2021 19:00","03/12/2021 20:00", "03/12/2021 21:00", "03/12/2021 22:00"]
address = ["16, Vla Gaudelet, 75011 Paris", "1, Vla Gaudelet, 75011 Paris", "79 Av. de la République, 75011 Paris", "72 Av. de la République, 75011 Paris", "67 Av. de la République, 75011 Paris", "12bis Vla Gaudelet, 75011 Paris", "84 Av. de la République, 75011 Paris", "106 Rue Oberkampf, 75011 Paris", "110 Rue Oberkampf, 75011 Paris" , "75 Av. de la République, 75011 Paris", "66 Av. de la République, 75011 Paris" ]
name = ["Kentucky fried Chicken", "Secret bar", "bar num 2", "Main restaurant", "clothes and more", "goodies store", "main merchandise store", "tacos bar", "take away bar and restaurant", "Pizza Yolo", "makdo", "kcf", "BK", "Pizza Hutte", "Food trucky", "cheezi truck"]
price = rand(5...20)
artistName = ["Arno Cost", "Guillaume Cabaret", "Daft Punk", "Parcels", "Fatima Yamaha", "Mac Demarco", "The Strokes", "Bicep", "Sébastien Tellier", "Air"]
itemName = ["fries", "shoes", "goodies", "burger", "t-shirt", "bag", "shots", "red wine", "white wine", "beer", "souvenir", "hot dog", "sausage"]
desc = ["best ever", "good looking", "tasty", "get drunk fast", "try it because a description would not describe it"]
pointName = ["Toilette", "Le Perchoir", "Gaudelet", "La Rotonde", "Exit", "Entry"]
pointDesc = ["Main", "Second"]
pointAddress = ["26 Av. Jean Aicard, 75011 Paris", "30 Av. Jean Aicard, 75011 Paris", "1 Vla Gaudelet, 75011 Paris", "7 Vla Gaudelet, 75011 Paris", "115 Rue Oberkampf, 75011 Paris","120 Rue Oberkampf, 75011 Paris", "15 Av. Jean Aicard, 75011 Paris", "19 Av. Jean Aicard, 75011 Paris", "71 Rue Servan, 75011 Paris", "69 Rue Servan, 75011 Paris", "3 Rue Saint-Hubert, 75011 Paris", "9 Rue Saint-Hubert, 75011 Paris", "78 Rue Saint-Maur, 75011 Paris", "96 Rue Saint-Maur, 75011 Paris", "68 Av. de la République, 75011 Paris", "78 Av. de la République, 75011 Paris", "53 Av. de la République, 75011 Paris", "58 Av. de la République, 75011 Paris"]
picForRestaurant = ["truck.jpeg", "truck1.jpeg", "truck3.jpeg", "restaurant.jpeg", "souvenir.jpeg"]
picForFoodsAndDrinks = ["fries1.jpeg", "fries2.jpeg", "pizza1.jpeg", "pizza2.jpeg", "pizza3.jpeg", "burger1.jpeg", "burger2.jpeg", "burger3.jpeg", "beer.jpeg", "beer2.jpeg", "water.jpeg", "white_wine.jpeg", "red_wine.jpeg", "coca.jpeg"]
picForArtists = ["artist1.jpeg", "artist2.jpeg", "artist3.jpeg", "artist4.jpeg", "artist5.jpeg"]


shops = [
  {
    name: "Fast Food",
    photo: "truck.jpeg",
    address: "16, Villa Gaudelet, 75011 Paris",
    items: [
      {
        photo: "fries1.jpeg",
        name: "fries",
        price: rand(5..20),
      },
      {
        photo: "burger1.jpeg",
        name: "burger",
        price: rand(5..20),
      },
      {
        photo: "pizza1.jpeg",
        name: "pizza",
        price: rand(5..20),
      },
      {
        photo: "pizza2.jpeg",
        name: "pizza",
        price: rand(5..20),
      },
      {
        photo: "water.jpeg",
        name: "water",
        price: rand(5..20),
      },
    ]
  },
  {
    name: "Bar",
    photo: "truck1.jpeg",
    address: "rue Saint-Maur, 75011 Paris",
    items: [
      {
        photo: "beer.jpeg",
        name: "beer",
        price: rand(5..20),
      },
      {
        photo: "beer2.jpeg",
        name: "beer",
        price: rand(5..20),
      },
      {
        photo: "white_wine.jpeg",
        name: "white wine",
        price: rand(5..20),
      },
      {
        photo: "red_wine.jpeg",
        name: "red wine",
        price: rand(5..20),
      },
      {
        photo: "water.jpeg",
        name: "water",
        price: rand(5..20),
      },
    ]
  }
]

shops.each do |shop_data|
  shop = Shop.create!(
    name: shop_data[:name],
    address: shop_data[:address],
    festival_id: Festival.all.first.id
  )
  shop.image.attach(io: File.open("app/assets/images/#{shop_data[:photo]}"), filename: "#{shop_data[:photo]}")
  shop.save!

  shop_data[:items].each do |item_data|
    item = Item.create!(
      name: item_data[:name],
      shop: shop,
      price: item_data[:price]
    )
    item.image.attach(io: File.open("app/assets/images/#{item_data[:photo]}"), filename: "#{item_data[:photo]}")
  end
end
puts "shops created"

 pointName.each do |point|
    point = PointOfInterest.create!(
    name: point,
    description: pointDesc.sample ,
    address: pointAddress.sample,
    festival_id: Festival.all.first.id
  )
   point.save!
end

nameday.each do |name|
  days = []
  day = Day.create!(
    name: name,
    festival_id: Festival.all.first.id
  )
  days << day
  days.each do |day|

    5.times do |index|
      start = DateTime.parse(time[index])
      artist = Artist.create!(
        name: artistName.sample,
        start_time: start,
        finish_time: start + (1/24.0),
        day_id: day.id,
        point_of_interest_id: PointOfInterest.where("name = ? OR name = ? OR name = ?", "Le Perchoir", "Gaudelet", "La Rotonde" ).sample.id
      )
        artist.image.attach(io: File.open("app/assets/images/#{picForArtists[index]}"), filename: "#{picForArtists[index]}")
        day.save!
        artist.save!

    end
  end
end

puts "creating chatroom"
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
