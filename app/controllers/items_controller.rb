class ItemsController < ApplicationController
   before_action :set_item, only: [:edit, :show, :update]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
    redirect_to root_path
    else
    render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if user_signed_in? && current_user.id == @item.user_id
    elsif user_signed_in?
    redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
  end

  def update
    if @item.update(item_params)
    redirect_to item_path(@item.id)
    else
    render :edit, status: :unprocessable_entity
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id,
    :prefecture_id, :shipping_day_id, :shipping_fee_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
