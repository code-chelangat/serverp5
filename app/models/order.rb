class Order < ApplicationRecord
    belongs_to :product
    belongs_to :user
    has_one :category, :through => :product

    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :price, presence: true, numericality: { greater_than: 0 }
end
