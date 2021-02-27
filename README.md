# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email     | string | null: false |
| password   | string | null: false |
| name | string | null: false |
| profile   | text   | null: false |
| occupation | text | null: false |
| position | text | null: false

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| catch_copy | text | null: false |
| image | ActiveStorageで実装 | null: false |
| user | references | null: false

- has_many :users
- has_many :comments

## commentsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text | text | null: false |
| user | references |
| prototype | references |

### Association

- belongs_to users
- belongs_to :prototypes