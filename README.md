# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| family_name_kanji  | string | null: false |
| first_name_kanji   | string | null: false |
| family_name_kana   | string | null: false |
| family_name_kana   | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| description        | text   | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| shipping_fee       | integer| null: false |
| shipping_area      | string | null: false |
| shipping_days      | integer| null: false |
| price              | integer| null: false |
| commition          | integer| null: false |
| profit             | integer| null: false |
| user               | references | null: false , foreign_key: true |
| purchase           | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル　（item_userテーブル）

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false , foreign_key: true |
| item               | references | null: false , foreign_key: true |
| post_code          | integer| null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| street_address     | string | null: false |
| building           | string |
| phone_number       | integer| null: false |


### Association

- belongs_to :user
- has_one :item
