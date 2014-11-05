namespace :db do
  desc "Output current count of models"
  task :count => :environment do
    Rails.application.eager_load!

    ActiveRecord::Base.descendants.each do |model|
      puts "#{model.table_name}: #{model.count}"
    end

  end
end
