class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    #order = OrderAddress.create(order_address_params)
    #@item = Item.find(params[:item_id])
    #@item = Item.find(params[:id])
    #@order_address = OrderAddress.new(order_address_params[:user_id, :item_id])
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_address_params
    params.require(:order_address).permit(
      :code,
      :area_id, 
      :municipality,
      :address,
      :building,
      :telephone,
    ).merge(user_id: current_user.id, item_id: params[:item_id])#token:params[:token]
  end
end