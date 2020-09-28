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
| birth            | integer | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :comments

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -----------------------------  |
| item_name        | string     | null: false                    |
| category         | string     | null: false                    |
| price            | string     | null: false                    |
| seller           | string     | null: false                    |
| introduction     | text       | null: false                    |
| image            | text       | null: false                    |
| condition        | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :item_purchases
- has_many :purchases, through: item_purchases
- belongs_to :users

## purchases テーブル

| Column           | Type       | Option                         |
|------------------| ---------- | ------------------------------ |
| buyer            | string     | null: false                    |
| purchase_date    | integer    | null: false                    |
| postal_code      | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| credit_number    | integer    | null: false                    |
| credit_limit     | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_many :items, through: item_purchases
- has_many :item_purchases
- belongs_to: user

## item_purchases テーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| purchase | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :purchase

## comments テーブル

| Column | Type       | Option                         |
| ----   | ---------- | ------------------------------ |
| text   | text       |                                |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to item