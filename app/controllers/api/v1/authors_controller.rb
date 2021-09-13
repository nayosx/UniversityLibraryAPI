class Api::V1::AuthorsController < ApplicationController
    before_action :find_obj, only: [:show, :update, :destroy]
    before_action :obj_params, only: :create

    def index
        @objs = Author.all.order(updated_at: :desc)
        render json: @objs
    end

    def show
        render json: @obj
    end

    def create
        @obj = Author.new(obj_params)
        if @obj.save
            render json: @obj
        else
            render json: {
                error: 'Unable to create', status: 400
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

    def find_obj
        @obj = Author.find(params[:id])
    end

    private
    def obj_params
        params.require(:author).permit(:name, :bio)
    end
end
