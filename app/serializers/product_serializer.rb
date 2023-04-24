class ProductSerializer < ActiveModel::Serializer
  attributes :id, :image, :title, :description, :quantity, :price, :category_id, :products_image , :get_image_url

  belongs_to :category

end
