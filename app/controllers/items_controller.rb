class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show]
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = Item.new
    @items = @item.user
  end

# showアクションを定義し、特定の商品情報w出力する @itemをその中で定義する

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :image, :status_id, :area_id, :delivery_fee_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end