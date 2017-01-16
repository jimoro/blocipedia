# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create wikis
10.times do
  User.create!(
    email:  Faker::Internet.unique.safe_email,
    password: Faker::Internet.password
  )
  5.times do
    Wiki.create!(
      title:  Faker::Lorem.sentence,
      body:   Faker::Lorem.paragraph
      )
  end
end
users = User.all
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
