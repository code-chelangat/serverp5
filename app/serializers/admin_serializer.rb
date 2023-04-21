class AdminSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :name

  # has_secure_password
end
