namespace :db do
  desc "Output current count of models"
  task :count => :environment do
    Rails.application.eager_load!

#    puts "Super Heroes/Heroines count: #{SuperHero.count}"

    ActiveRecord::Base.descendants.each do |model|
      puts "#{model.table_name}: #{model.count}"
    end

  end
end
