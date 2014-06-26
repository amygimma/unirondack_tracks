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

FactoryGirl.create(:camp_session)
FactoryGirl.create(:camp_session, name: "Teens")

FactoryGirl.create(:admin_user)
FactoryGirl.create(:camper, camp_session_id: 1)
FactoryGirl.create(:camper, name: "Senior Stinkhead", camp_session_id: 2)

FactoryGirl.create(:camper, name: "Ugly Pants", camp_session_id: 2)

@tshirt = FactoryGirl.create(:category, name: "t-shirt", price: 10.00)
@popsicle = FactoryGirl.create(:category, name: "popsicle", price: 1.00)
@candybars = FactoryGirl.create(:category, name: "candy bars", price: 1.50)



FactoryGirl.create(:item, category: @tshirt, name: "t-shirt", price: 10.00, quantity: 150, sold: 50, size: "small", color: "blue")
FactoryGirl.create(:item, category: @tshirt, name: "t-shirt", price: 10.00, quantity: 150, sold: 50, size: "medium", color: "black")
FactoryGirl.create(:item, category: @tshirt, name: "t-shirt", price: 10.00, quantity: 150, sold: 50, size: "large", color: "green")
FactoryGirl.create(:item, category: @popsicle, name: "Popsicle", price: 1.00, quantity: 150, sold: 50, flavor: "cherry")
FactoryGirl.create(:item, category: @popsicle, name: "Popsicle", price: 1.00, quantity: 150, sold: 50, flavor: "orange")
FactoryGirl.create(:item, category: @candybars, name: "Snickers", price: 1.50, quantity: 150, sold: 50)
FactoryGirl.create(:item, category: @candybars, name: "KitKat", price: 1.50, quantity: 150, sold: 50)