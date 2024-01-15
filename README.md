# usersテーブル
| Column               | Type       | Option                       |
|----------------------|------------|------------------------------|
| nickname             | string     | null: false                  |
| email                | string     | null: false                  |
| encrypted_password   | string     | null: false, unique: true    |
| role_id              | integer    | null: false                  |
|
belongs_to:family_member
has_many: events

<!-- # familyMembersテーブル
| Column               | Type       | Option      |
|----------------------|------------|-------------|
| falmily_name         | string     | null:false  |
| user                 | references | null:false, foreign_key:true |
 -->

has_many: users

# eventsテーブル
| Column               | Type       | Option                       |
|----------------------|------------|------------------------------|
| help_date            | date       | null: false                  |
| help_count           | integer    | null: false                  |
| unit_price           | integer    | null: false                  |
| total_price          | integer    | null: false                  |
| goal_price           | integer    | null: false                  |
| user                 | references | null:false, foreign_key:true |

belongs_to: user







