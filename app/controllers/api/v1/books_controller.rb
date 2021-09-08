class Api::V1::BooksController < ApplicationController

    before_action :find_obj, only: [:show, :update, :destroy]
    before_action :obj_params, only: :create

    def index
        searchParams = request.query_parameters
        if searchParams[:search]
            @obj = Book.search(searchParams[:search], searchParams[:searchType])
            render json: @obj 
        else
            @objs = Book.all
            render json: @objs
        end
    end

    def show
        render json: @obj
    end

    def create
        @obj = Book.new(obj_params)
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
        @obj = Book.find(params[:id])
    end

    private 
    def obj_params
        params.require(:book).permit(:isbn, :title, :year, :total, :totalPage)
    end
end
