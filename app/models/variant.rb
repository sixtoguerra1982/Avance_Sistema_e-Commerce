class Variant < ApplicationRecord
    has_many :products_variants
    has_many :products, through: :products_variants
    enum size: ["S","M","L","XL"]
end
