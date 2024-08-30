FactoryBot.define do
  factory :order_shipping do
      post_code { '123-4567' }
      prefecture_id { 5 }
      city { '青山市中津' }
      street_address { '1-1' }
      building { '東京ハイツ' }
      phone_number { '09011115555' }
    end
  end
  
  #モデルじゃないのでアソシエーションは指定できない