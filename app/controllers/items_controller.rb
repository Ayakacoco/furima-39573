class ItemsController < ApplicationController

  def index
  end

  private

  def message_params
    params.require(:item).permit(:product, :image, :item_name, :category_id, :sales_status_id, :shopping_fee_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)

  
end
