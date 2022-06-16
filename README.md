# テーブル設計

## Users

|column             |type    |Options                  |
|-------------------|--------|-------------------------|
|id                 |integer |null: false              |
|nickname           |string  |null: false              |
|email              |string  |null: false, unique:true |
|password           |string  |null: false              |
|encrypted_password |string  |null: false              |
|birthday           |integer |null: false              |
|profile            |text    |null: false              |

### Association
has_many:active_relationship
has_many:passive

