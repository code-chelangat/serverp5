class AddressesController < ApplicationController
    def index
        render json: Address.all
    end
    def show
        render json: Address.find(params[:id])
    end
    def create 
         address = Address.create(address_params)
         if  address.save
            render json:  address, status: :created
         else
            render json:  address.errors, status: :unprocessable_entity
         end
    end
    def update
        address = Address.find(params[:id])
        if address.update(address_params)
            render json: { message: "product succesfully updated" }, status: :ok
           else 
            render json: address.errors, status: :unprocessable_entity
           end
    end
    def destroy
        address = Address.find(params[:id])
        if address.destroy
            render json: {mesage: "deleted successfully"},status: :ok
            end
    end
    private
    def address_params
        params.permit(:city, :address, :user_id, :region, :saved)
    end
end
