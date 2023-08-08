# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders




## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item_name      | string     | null: false                    |
| product        | text       | null: false                    |
| category_id    | integer    | null: false                    |
| sales_status_id| integer    | null: false                    |
| shopping_fee_id| integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| scheduled_delivery_id | integer | null: false                |
| price          | integer    | null: false                    |
| comment        | text       | null: false                    |



### Association

- belongs_to :user
- has_one :order



## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| postal_code| string     | null: false                    |
| prefecture_id | integer | null: false                    |
| city       | string     | null: false                    |
| addresses  | string     | null: false                    |
| building_name| string   | null                           |
| phone_number| string    | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- belong_to :order



## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :address
