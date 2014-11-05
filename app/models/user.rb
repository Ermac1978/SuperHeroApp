# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  role       :string(25)       default("user")
#

class User < ActiveRecord::Base
  has_many :super_heros

  def admin?
    self.role == 'admin'
  end

end