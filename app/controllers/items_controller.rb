class ItemsController < ApplicationController
   before_action :set_item, only: [:edit, :show, :update, :destroy]
   before_action :authenticate_user!, only: [:edit, :new ,:destroy]
   before_action :user_not_match, only:[:edit, :destroy]
   before_action :sold_out, only: :edit

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
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
  end

  def destroy
    if current_user.id == @item.user_id
    @item.destroy
    end
    redirect_to root_path
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

  def user_not_match
    if current_user.id != @item.user_id
    redirect_to root_path
    else
    end
  end

  def sold_out
    if Order.exists?(item_id: params[:id])
    redirect_to root_path
    else
    end
  end

end
