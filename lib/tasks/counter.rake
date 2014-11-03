namespace :db do
  desc "Output current count of models"
  task :count => :environment do
    puts SuperHero.count
  end
end
