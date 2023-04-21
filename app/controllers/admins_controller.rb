class AdminsController < ApplicationController
    def index
        render json: Admin.all
    end
    def show
        render json: Admin.find(params[:id])
    end
    def create 
        admin = Admin.create(admin_params)
        if admin.save
            render json: admin, status: :created
          else 
            render json: admin.errors, status: :unprocessable_entity
          end
    end
    def update
        admins = Admin.find(params[:id])
        if admins.update(admin_params)
            render json: { message: "product succesfully updated" }, status: :ok
           else 
            render json: admins.errors, status: :unprocessable_entity
           end
    end
    def destroy
        admins = Admin.find(params[:id])
        if admin.destroy
            render json: {mesage: "deleted successfully"},status: :ok
            end
    end
    private
    def admin_params
        params.permit(:email, :username, :name, :password)
    end
end
