class Review < ApplicationRecord
    belongs_to :user
    belongs_to :product

 validates :star_rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true
end
