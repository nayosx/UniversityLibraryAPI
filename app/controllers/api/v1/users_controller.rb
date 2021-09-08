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
        if @obj.valid?
            if @obj.save
                render json: @obj
            else
                render json: { 
                 error: 'Unable to create', status: 400
             }, status: 400
            end
        else
             render json: { 
                 error: 'Is not valid to create', status: 400
             }, status: 400
        end
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

    def login
        @obj = User.find_by(email: params[:email])
        if @obj && @obj.authenticate(params[:password])
            render json: {"message": "login ON"}, status: 200
        else
            render json: {"message": "login OFF"}, status: 401
        end
    end

    def logout
        render json: {"message": "Logout"}, status: 200
    end

    def find_obj
        @obj = User.find(params[:id])
    end

    private 
    def obj_params
        params.require(:user).permit(:rol_id, :name, :lastname, :email, :password, :phone, :password_confirmation)
    end
end
