class OrderSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :user_id, :quantity, :price

  belongs_to :product
    belongs_to :user
end
