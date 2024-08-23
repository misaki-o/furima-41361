class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #下記のActive_hashモデルに紐づく
  belongs_to_active_hash :category, :condition, :prefecture, :shipping_day, :shipping_fee
  
  #バリデーション
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1} , presence: true
  validates :condition_id, numericality: { other_than: 1} , presence: true
  validates :prefecture_id, numericality: { other_than: 1} , presence: true
  validates :shipping_day_id, numericality: { other_than: 1} , presence: true
  validates :shipping_fee_id, numericality: { other_than: 1} , presence: true
  validates :price, presence: true
  validates :user_id, presence: true

  #アソシエーション
  belongs_to :user
end
