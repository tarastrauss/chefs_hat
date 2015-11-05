class User < ActiveRecord::Base
  has_secure_password
  # Verify that an email exists and that it does not already exist in the db
  validates :email, presence: true, uniqueness: true
  has_many :memberships
  has_many :hats, through: :memberships
  has_many :recipes
  has_many :comments
  has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "50x50#" }, default_url: "default_image.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
