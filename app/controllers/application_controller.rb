class ApplicationController < ActionController::API
  require_relative '../lib/json_web_token'
  
    def authenticate_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
  
      begin
        payload = JsonWebToken.decode(header)
        @current_user = User.find(payload[:user_id]) if payload[:user_id]
        @current_admin = Admin.find(payload[:admin_id]) if payload[:admin_id]
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end
  end