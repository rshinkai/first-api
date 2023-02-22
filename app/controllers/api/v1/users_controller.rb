class Api::V1::UsersController < ApplicationController
    # TODO: list some functions
    def show
        # response format is JSON
        # params[:id] comes from path param like api/:id
        render json: User.find(params[:id])
    end

    # POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end 
    end

    # define user params
    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
