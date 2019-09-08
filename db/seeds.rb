# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
JoinItemsOrder.destroy_all
JoinTableCartsItem.destroy_all
Order.destroy_all
Cart.destroy_all 
User.destroy_all
# User.destroy_all
# #Création de pierre michel
# email = "teamrennes@contact.bzh"
# password = "rennes" #password très safe, je recommande vivement
# User.create(email:email, password: password, is_admin: true)


20.times do 
	Item.create(title: Faker::Book.title, description: Faker::Movie.quote, price: Faker::Number.decimal(l_digits: 2))
end

