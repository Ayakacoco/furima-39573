class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: [:index]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,            # 商品の値段
      card: order_params[:token],     # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user && @item.order.present?
  end
end
