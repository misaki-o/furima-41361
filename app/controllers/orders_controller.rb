class OrdersController < ApplicationController
  def index
     @order_shipping = OrderShipping.new
     @item = Item.find(params[:item_id])   # nannde??
  end
   
   def create
    @item = Item.find(params[:item_id])   # nannde??
    @order_shipping = OrderShipping.new(order_params)
    
    if @order_shipping.valid? 
    @order_shipping.save
    redirect_to root_path
    else
    render :index, status: :unprocessable_entity
    end
  end

   private

   #ログイン中のユーザーとみているアイテムidは.mergeで統合する
   def order_params
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :city, :street_address, :building, :phone_number, :order_id ).merge(user_id: current_user.id, item_id: params[:item_id])
   end

end
