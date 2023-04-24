class Product < ApplicationRecord
    has_one_attached :products_image 
    belongs_to :category
    has_many :reviews
    has_many :orders

   
    
    validates :title, presence: true
    validates :description, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :price, presence: true, numericality: { greater_than: 0 }


     def get_image_url
      if self.products_image.blob
              my_object_attachment = self.products_image.blob.key
              image_url = Cloudinary::Utils.cloudinary_url(my_object_attachment)
                   
        end
      end

end
