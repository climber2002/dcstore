class Product < ActiveRecord::Base
  validates :product_name, presence: true
  validates :productid, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  belongs_to :category
  validates_presence_of :category

end
