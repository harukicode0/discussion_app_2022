# アプリケーション名

Yes or no

# アプリケーション概要

気軽にディスカッションできる Web アプリ。自身の興味のある議題を作成することができる。自分の投稿を賛成・反対のポジションに分けて投稿することができる。

# URL

https://discussion-app-2022.herokuapp.com/

# ID/Pass

なし

# 利用方法

このアプリケーションの利用方法を記載。説明が長い場合は、箇条書きでリスト化すること。

# アプリケーションを作成した背景

このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記載。

# 洗い出した要件 スプレッドシートのリンク

https://docs.google.com/spreadsheets/d/1QWWHghbWRo9-XWM-wmdshIZS6ENBy0UuUI6zbIkFiLk/edit#gid=982722306

# 実装した機能についての画像や GIF およびその説明※ 実装した機能について、それぞれどのような特徴があるのかを列挙する形で記載。画像は Gyazo で、GIF は GyazoGIF で撮影すること。

# 実装予定の機能 洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記載。

# データベース設計 ER 図を添付。

# 画面遷移図 画面遷移図を添付。

# 開発環境 使用した言語・サービスを記載。

# テーブル設計

## Users

| column             | type    | Options                  |
| ------------------ | ------- | ------------------------ | ----------- |
| id                 | integer | null: false              |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| password           | string  | null: false              |
| encrypted_password | string  | null: false              |
| birthday           | integer | null: false              |
| profile            | text    | null: false              |
| sex_id             | integer | null: false              | Active_Hash |

### Association

has_many:active_relationships,class_name:"Relationship", foreign_key: "follower_id", dependent: :destroy
has_many:passive_relationships,class_name:"Relationship", foreign_key: "following_id", dependent: :destroy
has_many:Rooms
has_many:User_rooms
has_many:Comments
has_many:Likes
has_many:replys
has_many:owners
has_many:issues
has_many:issue_comments

## Relationships

| column      | type    | Options     |
| ----------- | ------- | ----------- | ------------------------ |
| id          | integer | null: false |
| follower_id | integer | null: false | ← フォロワーの数         |
| followed_id | integer | null: false | ← フォローしている人の数 |

### Association

belongs_to:follower,class_name:"User"
belongs_to:following,class_name:"User"

## Rooms

| column   | type     | Options     |
| -------- | -------- | ----------- |
| id       | integer  | null: false |
| title    | string   | null: false |
| deadline | datetime |             |

### Association

has_many:Users
has_many:User_rooms
has_many:comments
has_many:Tags
has_many:Room_tags
has_many:issues

## User_rooms

| column | type       | Options                       |
| ------ | ---------- | ----------------------------- |
| id     | integer    | null: false                   |
| user   | references | null: false,foreign_key: true |
| room   | references | null: false,foreign_key: true |

### Association

belongs_to:User
belongs_to:Room
has_one:position
has_one:owner

## Owners

| column | type       | Options                       |
| ------ | ---------- | ----------------------------- |
| id     | integer    | null: false                   |
| user   | references | null: false,foreign_key: true |
| room   | references | null: false,foreign_key: true |

### Association

belongs_to:User
belongs_to:Room

## Positions

| column      | type       | Options                       |
| ----------- | ---------- | ----------------------------- | ----------- |
| id          | integer    | null: false                   |
| user_room   | references | null: false,foreign_key: true |
| position_id | integer    |                               | active_hash |

### Association

belongs_to:user_room
has_many:comment
has_many:issue_comments

## Comments

| column               | type    | Options                       |
| -------------------- | ------- | ----------------------------- | --- |
| id                   | integer | null: false                   |
| text                 | text    | null: false                   |
| user                 | integer | null: false,foreign_key: true |
| room                 | integer | null: false,foreign_key: true |
| standing_position_id | integer | null: false,foreign_key: true | AH  |

### Association

belongs_to:User
belongs_to:Room
has_many:likes
has_many: replys
belongs_to:position

## Tags

| column | type    | Options     |
| ------ | ------- | ----------- |
| id     | integer | null: false |
| tag    | string  | null: false |

### Association

has_many:Rooms
has_many:Room_tags

## Room_tags

| column | type    | Options                       |
| ------ | ------- | ----------------------------- |
| id     | integer | null: false                   |
| room   | integer | null: false,foreign_key: true |
| tag    | integer | null: false,foreign_key: true |

### Association

belongs_to:Room
belongs_to:Tag

## Likes

| column  | type    | Options                       |
| ------- | ------- | ----------------------------- |
| id      | integer | null: false                   |
| user    | integer | null: false,foreign_key: true |
| comment | integer | null: false,foreign_key: true |

### Association

belongs_to: User
belongs_to: Comment

## Reply

| column  | type    | Options                       |
| ------- | ------- | ----------------------------- |
| id      | integer | null: false                   |
| text    | text    | null: false                   |
| comment | integer | null: false,foreign_key: true |
| user    | integer | null: false,foreign_key: true |

### Association

belongs_to: comment
belongs_to: user

## Issues

| column      | type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| id          | integer    | null: false                   |
| issue_title | string     | null: false                   |
| room        | references | null: false,foreign_key: true |
| owner       | references | null: false,foreign_key: true |

### Association

belongs_to: user
belongs_to: room
has_many: IssueComments

## IssueComments

| column               | type       | Options                       |
| -------------------- | ---------- | ----------------------------- | --- |
| id                   | integer    | null: false                   |
| text                 | text       | null: false                   |
| issue_id             | references | null: false,foreign_key: true |
| owner                | references | null: false,foreign_key: true |
| standing_position_id | integer    | null: false,foreign_key: true | AH  |

### Association

belongs_to: issues
belongs_to: user
belongs_to: position

## IssueLikes

| column         | type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| id             | integer    | null: false                   |
| user           | references | null: false,foreign_key: true |
| issue_comments | references | null: false,foreign_key: true |

### Association

belongs_to: issues
belongs_to: user
