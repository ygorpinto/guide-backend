class Api::V1::StocksController < ApplicationController
  before_action :set_stock, only: [:show, :update, :destroy]
  def index
    # os ultimos 30 pregoes, porém customizável
    @stocks = Stock.all.order('id DESC')
    render json: @stocks.limit(30)
  end

  def show
    render json: @stock
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
     render json: @stock, status: :created, location: @stock
    else
     render json: @stock.errors, status: :unprocessable_entity
    end
  end

  def update
    if @stock.update(stock_params)
      render json: @stock
    else
     render json: @stock.errors, status: :unprocessable_entity

   end
  end

  def destroy
    @stock.destroy
  end

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end 

  def stock_params
    params.require(:stock).permit(:symbol, :price, :date)
  end

end