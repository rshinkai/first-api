class Api::V1::UsersController < ApplicationController
    # TODO: list some functions
    def show
        # response format is JSON
        # params[:id] comes from path param like api/:id
        render json: User.find(params[:id])
    end
end
