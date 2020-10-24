class UsersController < ApplicationController 
    skip_before_action :authenticate_request, only: :create

    def index
        users = User.all()
        render json: { users: users }
    end

    def create
        user = User.new(email: params["email"], password: params["password"])
        user.save!
        render json: { error: 'Could not create user' }, status: 401 unless user
        render json: { user: user }
    end

    def update
        user = User.find_by(id: params[:id])
        new_attributes = {}
        new_attributes["name"] = params["name"] if params["name"]
        new_attributes["email"] = params["email"] if params["email"]
        new_attributes["password"] = params["password"] if params["password"]
        user.update(new_attributes)
        render json: { user: user }
    end
end