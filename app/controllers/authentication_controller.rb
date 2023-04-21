class AuthenticationController < ApplicationController
  before_action :authenticate_request, except: :authenticate

  def authenticate
    user = User.find_by(email: login_params[:email])
    admin = Admin.find_by(email: login_params[:email])
  
    if user && user.is_a?(User) && user.authenticate(login_params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, admin: false }
    elsif admin && admin.is_a?(Admin) && admin.authenticate(login_params[:password])
      token = JsonWebToken.encode(admin_id: admin.id)
      render json: { token: token, admin: true }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
  

  def login_params
    params.permit(:email, :password)
  end
end
