class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def mitem_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id,
    :prefecture_id, :shipping_day_id, :shipping_fee_id, :price, :image).merge(user_id: current_user.id)
  end

end
