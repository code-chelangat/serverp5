class Admin < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true
end
