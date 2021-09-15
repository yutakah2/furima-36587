class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    #order = OrderAddress.create(order_address_params)
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_address_params
    params.require(:order_adress).permit(
      :code,
      :area_id, 
      :municipality,
      :address,
      :building,
      :telephone,
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
