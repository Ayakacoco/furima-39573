class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit]
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
    if current_user == @item.user
      @item.destroy
      redirect_to root_path(@item)
    else
      redirect_to root_path(@item)
    end
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

  #def move_to_index
    #unless user_signed_in?
      #redirect_to action: :new
    #end
  #end

end
