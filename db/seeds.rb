# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all

50.times do
	Product.create(title: Faker::Commerce.product_name, price: Faker::Commerce.price, released_on: Faker::Date.between(2.days.ago, Date.today), active: [0, 1].sample)
end