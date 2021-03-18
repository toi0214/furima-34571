class OrdersController < ApplicationController

  def index
    @order = BuyHistory.new
  
    @item = Item.find(params[:item_id])
  end

  def create

    @order = BuyHistory.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:buy_history).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
end