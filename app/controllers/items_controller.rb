class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
    # if current_user == @item.user
    # redirect_to root_path
    # end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:item, :explanation, :day_id, :area_id, :condition_id, :charges_id, :category_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user.id
  end
end
