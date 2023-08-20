class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :destroy]
  before_action :move_to_index, only: [:edit]


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    @orders = Order.includes(:user).where(item: @item)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product, :image, :item_name, :category_id, :sales_status_id, :shopping_fee_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def move_to_index
    redirect_to root_path if @item.order.present?
  end
end