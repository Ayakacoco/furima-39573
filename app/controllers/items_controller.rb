class ItemsController < ApplicationController
  #before_action :set_item, only: [:edit, :show]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :move_to_index, except: [:index]

  def index
    #@items = Item.all
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
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

  def show
  end

  private

  def item_params
    params.require(:item).permit(:product, :image, :item_name, :category_id, :sales_status_id, :shopping_fee_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  #def set_tweet
    #@item = Item.find(params[:id])
  #end

  #def move_to_index
    #unless user_signed_in?
      #redirect_to action: :new
    #end
  #end

end
