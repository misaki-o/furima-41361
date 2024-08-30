class OrderShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_address, :building, :phone_number, :order_id, :item_id, :user_id

  with_options presence: true do
   validates :post_code , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
   validates :prefecture_id, numericality: {other_than: 1}
   validates :city
   validates :street_address
   validates :phone_number, format: {with: /\A[0-9]{10,11}\z/ }
   validates :item_id
   validates :user_id
  end

   def save
    #注文情報を保存
    order = Order.create(item_id: item_id, user_id: user_id)
    #配送情報を保存（上記で定義したoderのoder.idを使う）
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building: building, phone_number: phone_number, order_id: order.id )
  end

end