# テーブル設計

## usersテーブル

| Colum                | Type   | Options     |
| -------------------- | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |

### Association

- has_many :items
- has_many :purchase_record
- has_one :shipping_info


## itemsテーブル

| Colum      | Type   | Options     |
| ---------- | ------ | ----------- |
| item       | string | null: false |
| image      | string | null: false |
| category   | string | null: false |
| price      | string | null: false |

### Association

- belongs_to :users
- has_one :purchase_records
- has_one :shipping_info

## purchase_records

| Colum      | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user_id    | references | foreign_key: true |
| item_id    | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping_info

## shipping_info

| Colum        | Type   | Options     |
| ------------ | ------ | ----------- |
| item_name    | string | null: false |
| image_name   | string | null: false |
| delivery_fee | string | null: false |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :purchase_records
