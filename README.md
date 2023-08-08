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
| birth_date         | integer| null: false               |

### Association

- has_many :items
- has_many :addresses



## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item_name   | string     | null: false                    |
| product     | text       | null: false                    |
| category    | integer    | null: false                    |
| sales_status| integer    | null: false                    |
| shopping_fee| integer    | null: false                    |
| prefecture  | integer    | null: false                    |
| scheduled_delivery | integer | null: false                |
| price       | integer    | null: false                    |
| content     | text       | null: false                    |



### Association

- belongs_to :user
- has_many :orders



## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| postal_code| integer    | null: false                    |
| Prefecture | integer    | null: false                    |
| city       | integer    | null: false                    |
| addresses  | integer    | null: false                    |
| phone_number| integer   | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order



## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| items      | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item