
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
