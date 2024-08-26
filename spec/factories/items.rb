FactoryBot.define do
  
  factory :item do
    item_name          {Faker::Commerce.product_name}
    description        {Faker::Lorem.sentence} 
    category_id        {Faker::Number.between(from: 1, to: 11)}
    condition_id       {Faker::Number.between(from: 1, to: 7)}
    shipping_fee_id    {Faker::Number.between(from: 1, to: 2)}
    shipping_day_id    {Faker::Number.between(from: 1, to: 3)}
    prefecture_id      {Faker::Number.between(from: 2, to: 48)}
    price              {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end