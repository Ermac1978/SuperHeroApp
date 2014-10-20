class CreateSuperHeros < ActiveRecord::Migration
  def change
    create_table :super_heros do |t|
      t.string :hero_name
      t.string :secret_identity
      t.string :powers
      t.string :team

      t.timestamps
    end
  end
end
