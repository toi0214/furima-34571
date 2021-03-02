# README
## usersテーブル

| Column              | Type    | Options      |
| ------------------- | ------- | ------------ |
| nickname            | string  | null: false  |
| email               | string  | unique: true |
| encrypted_password  | string  | null: false  |
| first_name          | string  | null: false  |
| second_name         | string  | null: false  |
| given_name          | string  | null: false  |
| last_name           | string  | null: false  |


### Association

- has_many :items
- has_many :

## itemテーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| item_name       | string     | null: false       |
| text            | text       | null: false       |
| category_id     | string     | null: false       |
| status_id       | string     | null: false       |
| price           | string     | null: false       |
| area_id         | string     | null: false       |
| days_id         | string     | null: false       |
| delivery_fee_id | string     | null: false       |
| user            | references | foreign_key: true |


### Association

- belongs_to :user
- has_many :buys

## buysテーブル

| Column      | Type      | Options           |
| ----------- | --------- | ----------------- |
| nickname    | reference | foreign_kye: true |
| item_name   | reference | foreign_kye: true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## Addressesテーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| postal_code    | string    | null: false |
| prefectures_id | string    | null: false |
| municipality   | string    | null: false |
| address        | string    | null: false |
| building_name  | string    | null: true  |
| phone_number   | string    | null: false |

### Association
 
- has_one :buy