class ProductsController < ApplicationController
    def index
        products = Product.all
        render json: products
    end
    def show
        render json: Product.find(params[:id])
    end
    def create
        products = Product.new(product_params)
        if products.save!
            render json: products ,status: :created
        else 
            render json: products.errors, status: :unprocessable_entity
        end
    end
    def update
        product = Product.find_by(id: params[:id])
        if product.update(product_params)
          products = Product.all # Get the updated list of products
          render json: { 
            message: "Product updated successfully", 
            products: products 
          }, status: :ok
        else
          render json: { 
            errors: product.errors.full_messages 
          }, status: :unprocessable_entity
        end
      end
      
    def destroy
        products = Product.find_by(id: params[:id])
      if products.destroy
      render json: {mesage: "deleted successfully"},status: :ok
      end
    end
    private
    def product_params
        params.permit(:image, :title, :description, :quantity, :price, :category_id, :products_image)
    end

end
