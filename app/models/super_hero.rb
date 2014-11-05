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
#  user_id         :integer
#

class SuperHero < ActiveRecord::Base
  validates :hero_name, presence: true
  validates :secret_identity, presence: true
  validates :powers, presence: true
  validates :team, presence: true

  scope :entries_with_pics, -> { where.not(pic: nil) }

# scope :for_user, ->(user) { where("user_id = ?, user.id) }
  scope :for_user, ->(user) { where(user: user) }

  mount_uploader :pic, PicUploader

  belongs_to :user

end
