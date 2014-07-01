# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Camper.destroy_all
AdminUser.destroy_all
CampSession.destroy_all
Item.destroy_all
Category.destroy_all
User.destroy_all

FactoryGirl.create(:user)
  # email "example@email.com" password 12345678

FactoryGirl.create(:camp_session)
FactoryGirl.create(:camp_session, name: "Teens")

FactoryGirl.create(:admin_user)
FactoryGirl.create(:camper, camp_session_id: 1)
FactoryGirl.create(:camper, name: "Senior Stinkhead", camp_session_id: 2)

FactoryGirl.create(:camper, name: "Ugly Pants", camp_session_id: 2)

@tshirts = FactoryGirl.create(:category, name: "t-shirts", price: 10.00)
@popsicles = FactoryGirl.create(:category, name: "popsicles", price: 1.00)
@candybars = FactoryGirl.create(:category, name: "candy bars", price: 1.50)



@tshirt = FactoryGirl.create(:item, category: @tshirt, name: "t-shirt", price: 10.00, quantity: 150, sold: 50, size: "small", color: "blue")
FactoryGirl.create(:item, category: @tshirts, name: "t-shirt", price: 10.00, quantity: 150, sold: 50, size: "medium", color: "black")
FactoryGirl.create(:item, category: @tshirts, name: "t-shirt", price: 10.00, quantity: 150, sold: 50, size: "large", color: "green")
@popsicle1 = FactoryGirl.create(:item, category: @popsicles, name: "Popsicle", price: 1.00, quantity: 150, sold: 50, flavor: "cherry")
@popsicle2 = FactoryGirl.create(:item, category: @popsicles, name: "Popsicle", price: 1.00, quantity: 150, sold: 50, flavor: "orange")
@candybar = FactoryGirl.create(:item, category: @candybars, name: "Snickers", price: 1.50, quantity: 150, sold: 50)
FactoryGirl.create(:item, category: @candybars, name: "KitKat", price: 1.50, quantity: 150, sold: 50)

@cart = FactoryGirl.create(:cart, camper: Camper.first)

FactoryGirl.create(:cart_item, cart: @cart, item: @tshirt)
FactoryGirl.create(:cart_item, cart: @cart, item: @popsicle1)
FactoryGirl.create(:cart_item, cart: @cart, item: @popsicle2)
FactoryGirl.create(:cart_item, cart: @cart, item: @candybar)