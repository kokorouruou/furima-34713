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

｜Column                     |Type    |Options                      |
｜---------------------------|--------|-----------------------------|
｜nickname                   |string  |null: false                  |
｜email                      |string  |null: false, unique: true    |
｜encrypted_password         |string  |null: false                  |
｜last_name                  |string  |null: false                  |
｜first_name                 |string  |null: false                  |
｜last_name_kana             |string  |null: false                  |
｜first_name_kana            |string  |null: false                  |
｜birthday                   |date    |null: false                  |

### Association

- has_many : items
- has_many : comments
- has_many : purchases

## itemsテーブル

｜Column               |Type        |Options            |
｜---------------------|------------|-------------------|
｜title                |string      |null: false        |
｜text                 |text        |null: false        |
｜price                |integer     |null: false        |
｜category_id          |integer     |null: false        |
｜product_condition_id |integer     |null: false        |
｜delivery_charge_id   |integer     |null: false        |
｜prefecture_id        |integer     |null: false        |
｜day_to_ship_id       |integer     |null: false        |
｜user                 |references  |foreign_key: true  |




### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :product_condition
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :day_to_ship

## commentsテーブル

|Column           |Type    |Options        |
|-----------------|--------|---------------|
|text             |string  |null: false    |

### Association

- belongs_to :user
- belongs_to :item

## purchasesテーブル
|Column           |Type        |Options            |
|-----------------|------------|-------------------|
|item             |references  |foreign_key: true  |
|user             |references  |foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one : shipping_address

## shipping addressesテーブル
|Column                   |Type       |Options                        |
|-------------------------|-----------|-------------------------------|
|postal_code              |string     |null: false                    |
|prefecture_id            |integer    |null: false                    |
|municipality             |string     |null: false                    |
|address                  |string     |null: false                    |
|building_name            |string     |                               |
|phone_number             |string     |null: false                    |
|purchase                 |references |foreign_key: true              |


### Association

belongs_to :purchase
belongs_to_active_hash :prefecture







