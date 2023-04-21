class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :star_rating, :comment, :user_id, :product_id
  
  belongs_to :user
end
