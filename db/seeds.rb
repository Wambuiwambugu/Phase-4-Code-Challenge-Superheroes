# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Deleting old data"
Hero.destroy_all
Power.destroy_all
HeroPower.destroy_all

puts "Creating heroes..."
5.times do 
    hero = Hero.create(
        name: Faker::Name.name,
        super_name: Faker::Superhero.name
    )
end

puts "Creating powers..."
13.times do 
    power = Power.create(
        name: Faker::Superhero.power,
        description: Faker::Lorem.paragraph
    )
end

puts "Creating hero_powers..."
15.times do 
    hero  = Hero.order('RANDOM()').first
    power = Power.order('RANDOM()').first

    hero_power = HeroPower.create(
        strength: ["Strong", "Weak", "Average"].sample,
        hero_id: hero.id,
        power_id: power.id
    )
end

puts "✅ Done seeding!"


