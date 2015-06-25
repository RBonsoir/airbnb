# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create(name: "Josh", email: "adhasdhjwl@jhfif.com", password: "jalsfsaw")
u2 = User.create(name: "Irene", email: "hello@email.org", password: "jalsfsae")

a1 = Apartment.new(title: "Cosy apartment", description: "very pretty", address: "rue des haies", price: "30EUR", city: "Paris")
a1.user = u
a1.save
a2 = Apartment.new(title: "Trendy apartment", description: "very pretty", address: "rue des haies", price: "30EUR", city: "Paris")
a2.user = u
a2.save
a3 = Apartment.new(title: "Awesome apartment", description: "very pretty", address: "rue des haies", price: "30EUR", city: "Paris")
a3.user = u2
a3.save
