class User < ApplicationRecord
    has_many :reviews
    has_many :orders
    has_many :addresses
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :phone_number, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
end
