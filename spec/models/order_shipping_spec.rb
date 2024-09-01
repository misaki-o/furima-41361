require 'rails_helper'

RSpec.describe OrderShipping, type: :model do

  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe "購入機能（注文情報）" do

    context "購入できるとき" do
     it "購入したいitem_id、購入者のuser_idが存在する、tokenやその他も存在する" do
       expect(@order_shipping).to be_valid
     end  
     it "building(任意)以外すべて存在する" do
      @order_shipping.building = ''
      expect(@order_shipping).to be_valid
     end  
    end
 
    context "購入できないとき" do
     it "item_idが空だと登録できない" do
       @order_shipping.item_id = nil
       @order_shipping.valid?
       
       expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
     end
     it "user_idが空だと登録できない" do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
     end
     it "post_codeが空だと登録できない" do
      @order_shipping.post_code = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Post code can't be blank")
     end
     it "post_codeがハイフンなしだと登録できない" do
      @order_shipping.post_code = '6021115'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
     end
     it "post_codeが数字以外だと登録できない" do
      @order_shipping.post_code = 'aaa-aaaa'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
     end
     it "prefecture_idが空だと登録できない" do
      @order_shipping.prefecture_id = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
     end
     it "cityが空だと登録できない" do
      @order_shipping.city = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("City can't be blank")
     end
     it "street_addressが空だと登録できない" do
      @order_shipping.street_address = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Street address can't be blank")
     end
     it "phone_numberが空だと登録できない" do
      @order_shipping.phone_number = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
     end
     it "phone_numberが数字以外だと登録できない" do
      @order_shipping.phone_number = '1aaaaaaaaaa'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
     end
     it "phone_numberが桁数足りないと登録できない" do
      @order_shipping.phone_number = '090111'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
     end
     it "phone_numberが桁数多いと登録できない" do
      @order_shipping.phone_number = '0901111555566'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
     end
     it "tokenが空では登録できないこと" do
      @order_shipping.token = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
     end
    end
  end
end
