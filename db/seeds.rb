# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#["Superman", "Batman", "Wonder Woman"].each do |x|
#  SuperHero.find_or_create_by(hero_name: x)
# end


#SuperHero.create(hero_name: 'Superman', secret_identity: 'Clark Kent', powers: 'Flight', team: 'Justice League')

# Fill database with sample data

10.times do |x|
  hero_name = Faker::Name.name
  secret_identity = Faker::Name.name
  powers = Faker::Name.name
  team = Faker::Name.name
  SuperHero.create!(:hero_name => hero_name,
                    :secret_identity => secret_identity,
                    :powers => powers,
                    :team => team)
end
