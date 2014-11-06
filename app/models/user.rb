# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  role            :string(25)       default("user")
#  password_digest :string(255)
#  email           :string(255)
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :super_heros

  def admin?
    self.role == 'admin'
  end

  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
end
