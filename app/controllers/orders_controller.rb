class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_address_params)
     if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
     else
      render action: :index
     end
  end

  private
  def order_address_params 
    params.require(:order_address).permit(:postal_cord, :city, :address, :building, :phone_number, :prefecture_id,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy' 
    )
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end

