# == Schema Information
#
# Table name: super_heros
#
#  id              :integer          not null, primary key
#  hero_name       :string(255)
#  secret_identity :string(255)
#  powers          :string(255)
#  team            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  pic             :string(255)
#

class SuperHero < ActiveRecord::Base
  mount_uploader :pic, PicUploader
end
