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
- has_many : purchase


## itemsテーブル

｜Column               |Type    |Options        |
｜---------------------|--------|---------------|
｜title                |string  |null: false    |
｜text                 |string  |null: false    |
｜price                |string  |null: false    |
｜category             |integer |null: false    |
｜product_condition    |integer |null: false    |
｜delivery_charge      |integer |null: false    |
｜shipping_area        |integer |null: false    |
｜day_to_ship          |integer |null: false    |




### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :product_condition
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :shipping_area
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

## shipping addressesテーブル
|Column                   |Type    |Options                        |
|-------------------------|--------|-------------------------------|
|postal_code              |string  |null: false                    |
|prefectures              |integer |null: false, foreign_key: true |
|municipality             |string  |null: false                    |
|address                  |string  |null: false                    |
|building_name            |string  |                               |
|phone_number             |string  |null: false                    |


### Association

belongs_to :purchase







