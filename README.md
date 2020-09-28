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

## users テーブル

| Column           | Type    | Options     |
| -----------------| ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| first_name_kanji | string  | null: false |
| last_name_kanji  | string  | null: false |
| first_name_kana  | string  | null: false |
| last_name_kana   | string  | null: false |
| birthday         | date    | null: false |

### Association

- has_many :items
- has_many :order_histories
- has_many :comments

## items テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | -----------------------------  |
| name                | string      | null: false                    |
| category_id         | integer     | null: false                    |
| price               | integer     | null: false                    |
| introduction        | text        | null: false                    |
| condition_id        | integer     | null: false                    |
| shipping_charges_id | integer     | null: false                    |
| shipping_area_id    | integer     | null: false                    |
| Days_to_ship_id     | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one  :order_history
- belongs_to :user, 

## address テーブル

| Column             | Type       | Option                         |
|--------------------| ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |
| order_history      | references | null: false, foreign_key: true |

### Association

- belongs_to :order_history

## order_histories テーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## comments テーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| text      | text       |                                |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item