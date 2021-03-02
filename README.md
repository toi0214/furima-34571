# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |

### Association

- has_many :items
- has_many :

## itemテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| item_name  | string     | null: false       |
| text       | text       | null: false       |
| category   | string     | null: false       |
| price      | string     | null: false       |
| user       | references | foreign_key: true |


### Association

- belongs_to :user
- has_many :buy

## buysテーブル

| Column      | Type      | Options     |
| ----------- | --------- | ----------- |
| nickname    | string    | null: false |
| item_name   | string    | null: false |

### Association

-has_one :address
-has_many :items
-belongs_to :user

## Addressesテーブル

| Column       | Type      | Options     |
| ------------ | --------- | ----------- |
| area         | string    | null: false |
| days         | string    | null: false |
| delivery_fee | string    | null: false |

### Association
 
 belongs_to :buy
 
