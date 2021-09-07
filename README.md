# テーブル設計

## usersテーブル

| Colum                | Type   | Options      |
| -------------------- | ------ | ------------ |
| email                | string | unique: true |
| encrypted_password   | string | null: false  |
| first_name           | string | null: false  |
| last_name            | string | null: false  |
| first_name_kana      | string | null: false  |
| last_name_kana       | string | null: false  |
| birthday             | string | null: false  |

### Association

- has_many :items
- has_many :record


## itemsテーブル

| Colum         | Type    | Options     |
| ------------- | ------- | ----------- |
| item          | string  | null: false |
| category_id   | string  | null: false |
| price         | integer | null: false |
| condition_id  | string  | null: false |
| charges_id    | string  | null: false |
| area_id       | string  | null: false |
| day_id        | string  | null: false |

### Association

- belongs_to :user
- has_one :record
- has_one :information

## purchase_records

| Colum   | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :information

## shipping_info

| Colum           | Type    | Options     |
| --------------- | ------- | ----------- |
| code            | integer | null: false |
| prefectures     | string  | null: false |
| municipalities  | string  | null: false |
| address         | string  | null: false |
| building        | string  | null: false |
| telephone       | integer | null: false |

### Association

- belongs_to :record
