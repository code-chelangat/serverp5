class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :phone_number, :username

  has_many :reviews
    has_many :orders
    has_many :addresses
    # has_secure_password
end
