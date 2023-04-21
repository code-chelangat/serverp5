class ProductSerializer < ActiveModel::Serializer
  attributes :id, :image, :title, :description, :quantity, :price, :category_id

  belongs_to :category
end
