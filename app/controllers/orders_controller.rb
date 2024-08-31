class OrdersController < ApplicationController
  def index
     gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
     @order_shipping = OrderShipping.new
     @item = Item.find(params[:item_id])   # nannde??
  end
   
   def create
    @item = Item.find(params[:item_id])   # nannde??
    @order_shipping = OrderShipping.new(order_params)
     if @order_shipping.valid? 
    pay_item
    @order_shipping.save
    redirect_to root_path
    else
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render :index, status: :unprocessable_entity
     end
   end

   private

   #ログイン中のユーザーとみているアイテムidは.mergeで統合する
   def order_params
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :city, :street_address, :building, :phone_number, :order_id ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
   end

   def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
   end

end
