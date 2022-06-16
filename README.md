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
|sex_id             |integer |null: false              |Active_Hash

### Association
has_many:active_relationships,class_name:"Relationship", foreign_key: "follower_id", dependent: :destroy
has_many:passive_relationships,class_name:"Relationship", foreign_key: "following_id", dependent: :destroy
has_many:Rooms
has_many:User_rooms
has_many:Comments
has_many:Likes
has_many:replys


## Relationships

|column             |type    |Options                      |
|-------------------|--------|-----------------------------|
|id                 |integer |null: false                  |
|follower           |integer |null: false,foreign_key: true|←フォローする人
|following          |integer |null: false,foreign_key: true|←フォローされる人

### Association
belongs_to:follower,class_name:"User"
belongs_to:following,class_name:"User"


## Rooms

|column             |type    |Options                       |
|-------------------|--------|------------------------------|
|id                 |integer |null: false                   |
|name               |string  |null: false                   |

### Association
has_many:Users
has_many:User_rooms
has_many:comments
has_many:Genres
has_many:Room_genres


## User_rooms

|column             |type    |Options                       |
|-------------------|--------|------------------------------|
|id                 |integer |null: false                   |
|user               |integer |null: false,foreign_key: true |
|room               |integer |null: false,foreign_key: true |
|position_id        |integer |                              |active_hash

### Association
belongs_to:User
belongs_to:Room

## Comments

|column             |type    |Options                       |
|-------------------|--------|------------------------------|
|id                 |integer |null: false                   |
|text               |text    |null: false                   |
|user               |integer |null: false,foreign_key: true |
|room               |integer |null: false,foreign_key: true |

### Association
belongs_to:User
belongs_to:Room
has_many:likes
has_many: replys


## Genres
|column             |type    |Options                       |
|-------------------|--------|------------------------------|
|id                 |integer |null: false                   |
|tag                |string  |null: false                   |

### Association
has_many:Rooms
has_many:Room_genres


## Room_genre

|column             |type    |Options                       |
|-------------------|--------|------------------------------|
|id                 |integer |null: false                   |
|room               |integer |null: false,foreign_key: true |
|genre              |integer |null: false,foreign_key: true |

### Association
belongs_to:Room
belongs_to:Genre


## Likes

|column             |type    |Options                       |
|-------------------|--------|------------------------------|
|id                 |integer |null: false                   |
|user               |integer |null: false,foreign_key: true |
|comment            |integer |null: false,foreign_key: true |

### Association
belongs_to: User
belongs_to: Comment


## Reply

|column             |type    |Options                       |
|-------------------|--------|------------------------------|
|id                 |integer |null: false                   |
|text               |text    |null: false                   |
|comment            |integer |null: false,foreign_key: true |
|user               |integer |null: false,foreign_key: true |

### Association
belongs_to: comment
belongs_to: user