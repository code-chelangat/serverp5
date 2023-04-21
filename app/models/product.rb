class Product < ApplicationRecord
    belongs_to :category
    has_many :reviews
    has_many :orders
    
    validates :title, presence: true
    validates :description, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :price, presence: true, numericality: { greater_than: 0 }
end
