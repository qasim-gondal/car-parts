class Product < ApplicationRecord
  belongs_to :catagory
  has_one_attached :main_image
  def self.ransackable_attributes(auth_object = nil)
    ["catagory_id", "created_at", "description", "id", "name", "price", "updated_at"]
  end
end
