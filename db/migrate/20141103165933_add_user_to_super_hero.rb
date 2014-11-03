class AddUserToSuperHero < ActiveRecord::Migration
  def change
    add_reference :super_heros, :user, index: true
  end
end
