# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| last_name          | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name         | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_date         | date                | null: false             |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| price                               | integer    | null: false       |
| name                                | string     | null: false       |
| category_id                         | integer    | null: false       |
| user                                | references | foreign_key: true |
| info                                | text       | null: false       |
| sales-status_id                     | integer    | null: false       |

### Association

- belongs_to :order

## orders table

| Column                   | Type       | Options           |
|--------------------------|------------|-------------------|
| item                     | references | foreign_key: true |
| user                     | references | foreign_key: true |

### Association

- has_one :shipping_address

## shipping address table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal_code                         | string     | null: false       |
| prefecture_id                       | integer    | null: false       |
| city                                | string     | null: false       |
| addresses                           | string     | null: false       |
| building                            | string     | null: false       |
| phone_number                        | string     | null: false       |

### Association

- belongs_to :order