class UsersController < ApplicationController
  
  def index
 
    render json: User.all
 
end
def show
    render json: User.find(params[:id])
end
def create 
    user= User.new(users_params)
    if user.save
      render json: user, status: :created
    else 
      render json: user.errors, status: :unprocessable_entity
    end
end
def update
    user = User.find(params[:id])
   if user.update(users_params)
  render json: { message: "user succesfully updated" }, status: :ok
 else 
  render json: user.errors, status: :unprocessable_entity
 end
end
def destroy
    users =  User.find(params[:id])
    if users.destroy
      render json: {mesage: "deleted successfully"},status: :ok
      end
end
private
def users_params
    params.permit(:email, :name, :phone_number, :username, :password)
end
end
