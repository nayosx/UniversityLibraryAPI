class Api::V1::LoansController < ApplicationController

    before_action :find_obj, only: [:show, :update, :destroy]
    before_action :obj_params, only: :create

    has_many :loans
    has_many :books, through: :loans

    has_many :loans
    has_many :users, through: :loans

    def index
        @objs = Loan.all
        render json: @objs, include: [:books, :users]
    end

    def show
        render json: @obj
    end

    def create
        @obj = Loan.new(obj_params)
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
        @obj = Loan.find(params[:id])
    end

    private
    def obj_params
        params.require(:loan).permit(:book_id, :user_id, :dateOfReturn, :penaltyFee)
    end
end
