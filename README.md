# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| last_name          | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name         | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_date         | string              | null: false             |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| price                               | string     | null: false       |
| name                                | text       | null: false       |
| category                            | text       | null: false       |
| user_id                             | references | foreign_key: true |
| image                               | string     | null: false       |
| info                                | text       | null: false       |
| sales-status                        | string     | null: false       |

### Association

- belongs_to :user
- has_one :order, through: :shipping_address

## orders table

| Column                   | Type       | Options           |
|--------------------------|------------|-------------------|
| item_id                  | references | foreign_key: true |
| user_id                  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item, through: :shipping_address

## shipping address table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal_cord                         | string     | null: false       |
| prefecture                          | string     | null: false       |
| city                                | string     | null: false       |
| addresses                           | string     | null: false       |
| phone_number                        | string     | null: false       |

### Association

- belongs_to :item
- belongs_to :order