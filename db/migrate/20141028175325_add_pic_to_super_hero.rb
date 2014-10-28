class AddPicToSuperHero < ActiveRecord::Migration
  def change
    add_column :super_heros, :pic, :string
  end
end
