class ProductsVariant < ApplicationRecord
  belongs_to :variant
  belongs_to :product
end
