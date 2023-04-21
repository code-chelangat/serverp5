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
        if products.save
        render json: products ,status: :created
        else 
            render json: products.errors, status: :unprocessable_entity
        end
    end
    def update
        products = Product.find(params[:id])
        if products.update(product_params)
            render json: { message: "product succesfully updated" }, status: :ok
           else 
            render json: products.errors, status: :unprocessable_entity
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
        params.permit(:image, :title, :description, :quantity, :price, :category_id)
    end

end
