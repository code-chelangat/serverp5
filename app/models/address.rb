class Address < ApplicationRecord
    belongs_to :user

    validates :city, presence: true
    validates :address, presence: true
    validates :region, presence: true
end
