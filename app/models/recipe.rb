class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :hat
  has_many :comments
  has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumb: "50x50#" }, default_url: "default_food.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  after_initialize :default_values

  private
    def default_values
      self.ingredients ||= " "
      self.instructions ||= " "
    end
end
