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
address = ["16, Vla Gaudelet, 75011 Paris", "79 Av. de la République, 75011 Paris", "67 Av. de la République, 75011 Paris", "12bis Vla Gaudelet, 75011 Paris", "84 Av. de la République, 75011 Paris", "La Halle aux Fruits, 104-106 Rue Oberkampf, 75011 Paris", "75 Av. de la République, 75011 Paris" ]
name = ["Kentucky fried Chicken", "Secret bar", "bar num 2", "Main restaurant", "clothes and more", "goodies"]
price = rand(5...20)
itemName = ["fries", "shoes", "goodies", "burger", "t-shirt", "bag", "shots", "red wine", "white wine", "beer", "souvenir", "hot dog", "sausage"]
desc = ["best ever", "good looking", "tasty", "get drunk fast", "try it because a description would not describe it"]
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


puts "seeding end"
