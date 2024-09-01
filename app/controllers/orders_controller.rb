class OrdersController < ApplicationController
   before_action :sold_out, only: :index
   before_action :find_item, only: [:index, :create]
   before_action :not_self_buy, only: :index
   before_action :authenticate_user!, only: :index

  def index
     gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
     @order_shipping = OrderShipping.new
  end
   
   def create
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

   def sold_out    
         if Order.exists?(item_id: params[:item_id])
         redirect_to root_path
         else
         end
   end

   def not_self_buy
      #先にfind_itemがbefore_actionで読み込まれている状態
      if current_user.id == @item.user_id
      redirect_to root_path
      else
      end
   end

   def find_item
      @item = Item.find(params[:item_id])
   end

end
