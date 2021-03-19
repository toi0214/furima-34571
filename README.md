# README
## usersテーブル

| Column              | Type    | Options                    |
| ------------------- | ------- | -------------------------- |
| nickname            | string  | null: false                |
| email               | string  | unique: true, null: false  |
| encrypted_password  | string  | null: false                |
| first_name          | string  | null: false                |
| second_name         | string  | null: false                |
| given_name          | string  | null: false                |
| last_name           | string  | null: false                |
| birthday_id         | date    | null: false                |


### Association

- has_many :items
- has_many :buys

## itemテーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| name　　　       | string     | null: false       |
| info            | text       | null: false       |
| category_id     | integer    | null: false       |
| status_id       | integer    | null: false       |
| price           | integer    | null: false       |
| area_id         | integer    | null: false       |
| delivery_day_id | integer    | null: false       |
| delivery_fee_id | integer    | null: false       |
| user            | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :buy

## buysテーブル

| Column      | Type      | Options           |
| ----------- | --------- | ----------------- |
| user        | reference | foreign_key: true |
| item        | reference | foreign_key: true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## Addressesテーブル

| Column         | Type      | Options           |
| -------------- | --------- | ----------------- |
| postal_code    | string    | null: false       |
| area_id        | integer   | null: false       |
| municipality   | string    | null: false       |
| address        | string    | null: false       |
| building_name  | string    |                   |
| phone_number   | string    | null: false       |
| buy            | reference | foreign_key: true |

### Association
 
- belongs_to :buy