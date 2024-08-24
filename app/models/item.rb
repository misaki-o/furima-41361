class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #下記のActive_hashモデルに紐づく
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee
  
  #バリデーション
  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
  numericality: {greater_than_or_equal_to:300, less_than_or_equal_to:9_999_999 }
  validates :user_id, presence: true

  #アソシエーション
  belongs_to :user
  has_one_attached :image
end
