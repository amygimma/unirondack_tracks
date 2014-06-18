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


FactoryGirl.create(:camp_session)
FactoryGirl.create(:admin_user)
FactoryGirl.create(:camper, camp_session_id: 1)
FactoryGirl.create(:item)
FactoryGirl.create(:item, name: "t-shirt", price: 10.00, quantity: 150, sold: 50)