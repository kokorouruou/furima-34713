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

｜Column                     |Type    |Options        |
｜---------------------------|--------|---------------|
｜nickname                   |string  |null: false    |
｜email                      |string  |null: false    |
｜encrypted_password         |string  |null: false    |
｜name                       |string  |null: false    |
｜birthday                   |string  |null: false    |

### Association

- has_many : items
- has_many : comments
- has_many : purchase
- has_one  : shipping address

## itemsテーブル

｜Column               |Type    |Options        |
｜---------------------|--------|---------------|
｜title                |string  |null: false    |
｜text                 |string  |null: false    |
｜image                |string  |null: false    |
｜price                |string  |null: false    |
｜category             |string  |null: false    |
｜product_condition    |string  |null: false    |
｜delivery_charge      |string  |null: false    |
｜shipping_area        |string  |null: false    |
｜day_to_ship          |string  |null: false    |




### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase

## commentsテーブル

|Column           |Type    |Options        |
|text             |string  |null: false    |

### Association

- belongs_to :user
- belongs_to :item

## purchasesテーブル
|Column           |Type        |Options            |
|item             |references  |foreign_key: true  |
|user             |references  |foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item

## shipping addressesテーブル
|Column                   |Type    |Options        |
|credit information       |string  |null: false    |
|address                  |string  |null: false    |

### Association

- belongs_to :user
- belongs_to :purchase







