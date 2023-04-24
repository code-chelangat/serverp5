class CategoriesController < ApplicationController
    def index
    render json: Category.all, each_serializer: NewCategorySerializer 
    
    end
    def show
        render json: Category.find(params[:id])
    end   
    def create 
        categories = Category.create(category_params)
        if categories.save
            render json: categories, status: :created
         else
            render json: categories.errors, status: :unprocessable_entity
         end
    end
    def update
        categories = Category.find(params[:id])
        if categories.update(category_params)
            render json: { message: "product succesfully updated" }, status: :ok
           else 
            render json: categories.errors, status: :unprocessable_entity
           end
    end
    def destroy
        categories = Category.find_by(id: params[:id])
      if categories.destroy
      render json: {mesage: "deleted successfully"},status: :ok
      end
    end
    private
    def category_params
        params.permit(:id, :name)
    end
end
