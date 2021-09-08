# テーブル設計

## usersテーブル

| Colum                | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| name                 | string | null: false               |
| email                | string | unique: true, null: false |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| last_name            | string | null: false               |
| first_name_kana      | string | null: false               |
| last_name_kana       | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :items
- has_many :records


## itemsテーブル

| Colum         | Type       | Options           |
| ------------- | ---------- | ----------------- |
| item          | string     | null: false       |
| category_id   | integer    | null: false       |
| price         | integer    | null: false       |
| condition_id  | integer    | null: false       |
| charges_id    | integer    | null: false       |
| area_id       | integer    | null: false       |
| day_id        | integer    | null: false       |
| user          | references | foreign_key: true |
| explanation   | text       | null: false       |

### Association

- belongs_to :user
- has_one :record

## records

| Colum   | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :information

## information

| Colum           | Type       | Options           |
| --------------- | ---------- | ----------------- |
| code            | integer    | null: false       |
| prefectures     | string     | null: false       |
| municipalities  | string     | null: false       |
| address         | string     | null: false       |
| building        | string     |                   |
| telephone       | string     | null: false       |
| record          | references | foreign_key: true |

### Association

- belongs_to :record
