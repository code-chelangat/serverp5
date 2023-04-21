class AddressSerializer < ActiveModel::Serializer
  attributes :id, :city, :address, :user_id, :region, :saved

  belongs_to :user
end
