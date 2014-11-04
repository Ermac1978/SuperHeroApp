class TestUsers < ActiveRecord::Migration
  def change
#    user = User.create(name: "Ahmad")
#    SuperHero.all.each do |sh|
#      sh.user = user
#      sh.save
#    end

    user = User.create(name: "Ahmad")
    SuperHero.update_all "user_id = #{user.id}"
  end
end
