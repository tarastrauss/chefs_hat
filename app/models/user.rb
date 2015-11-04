class User < ActiveRecord::Base
  has_secure_password
  # Verify that an email exists and that it does not already exist in the db
 validates :email, presence: true, uniqueness: true
 has_many :memberships
 has_many :hats, through: :memberships
 has_many :recipes

end
