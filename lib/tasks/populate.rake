require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
#    Rake::Task['db:reset'].invoke
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
  end
end
