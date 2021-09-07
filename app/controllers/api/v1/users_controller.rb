class Api::V1::UsersController < ApplicationController

    before_action :find_obj, only: [:show, :update, :destroy]
    before_action :obj_params, only: :create

    def index
        @objs = User.all
        render json: @objs
    end

    def show
        render json: @obj
    end

    def create
        @obj = User.new(obj_params)
        @obj.password = obj_params[:password]

        render json: @obj
    end

    def update
        if @obj
            @obj.update(obj_params) 
            render json: {
                message: 'Successfully updated'
            }, status: 200
        else
            render json: { 
                error: 'Unable to update', status: 400
            }, status: 400
        end
    end

    def destroy
        if @obj
            @obj.destroy
            render json: {
                message: 'Successfully deleted'
            }, status: 200
        else
            render json: { 
                error: 'Unable to delete', status: 400
            }, status: 400
        end
    end

    def find_obj
        @obj = User.find(params[:id])
    end

    private 
    def obj_params
        params.require(:user).permit(:rol_id, :name, :lastname, :email, :password, :phone)
    end
end
