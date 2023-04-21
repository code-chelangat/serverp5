class ReviewsController < ApplicationController
    def index
        render json: Review.all
    end
    def show
        render json: Review.find(params[:id])
    end
    def create 
        reviews = Review.create(new_reviews)
        if reviews.save
            render json: reviews, status: :created
         else
            render json: reviews.errors, status: :unprocessable_entity
         end
    end
    def update
        reviews = Review.find(params[:id])
        if reviews.update(new_reviews)
            render json: { message: "review succesfully updated" }, status: :ok
           else 
            render json: user.errors, status: :unprocessable_entity
           end
    end
      def product_reviews
    reviews = Review.where(product_id: params[:id])
    render json: reviews
  end
    def destroy
         reviews = Order.find_by(id: params[:id])
      if reviews.destroy
      render json: {mesage: "deleted successfully"},status: :ok
      end
    end
    private
    def new_reviews
        params.permit(:star_rating, :comment, :user_id, :product_id)
    end

end
