class UsersController < ApplicationController 
    skip_before_action :authenticate_request, only: :create

    def index
        users = User.all()
        render json: { users: users }
    end

    def create
        user = User.new(email: params["email"], password: params["password"])
        render json: { message: "user created" }
    end
end