require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  describe "アイテム出品" do

    context "出品できるとき" do
     it "全項目が存在している" do
       expect(@item).to be_valid
     end  
    end 
    context "出品できないとき" do
     it "画像がないと登録できない" do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it "商品名がないと登録できない" do
       @item.item_name = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Item name can't be blank")
       end
     it "商品の説明がないと登録できない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
      end
     it "カテゴリーがないと登録できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
     end
     it "商品の状態がないと登録できない" do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
     end
     it "配送料の負担がないと登録できない" do
      @item.shipping_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
     end
     it "発送元の地域がないと登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
     end
       it "配送までの日数がないと登録できない" do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
     end
     it "販売価格がないと登録できない" do
      @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
     end
    end
  end
end
