# usersテーブル

| Column               | Type   | Option                    |
|----------------------|--------|---------------------------|
| nickname             | string | null: false               |
| email                | string | null: false               |
| encrypted_password   | string | null: false, unique: true |

belongs_to:familyMember
has_many: chiles

# chilesテーブル
| Column               | Type       | Option                       |
|----------------------|------------|------------------------------|
| user                 | references | null:false, foreign_key:true |
| nickname             | string     | null:false                   |
| birthday             | date       | null: false                  |

belongs_to: user
belongs_to: familyMember

# familyMembersテーブル
| Column               | Type       | Option                       |
|----------------------|------------|------------------------------|
| users                | references | null:false, foreign_key:true |
| chiles               | references | null:false, foreign_key:true |

has_many: users
has_many: chiles
has_one: event

# eventsテーブル
| Column               | Type       | Option                       |
|----------------------|------------|------------------------------|
| help_date            | date       | null: false                  |
| help_count           | integer    | null: false                  |
| unit_price           | integer    | null: false                  |
| total_price          | integer    | null: false                  |
| goal_price           | integer    | null: false                  |
| user                 | references | null:false, foreign_key:true |
| chiles               | references | null:false, foreign_key:true |

belongs_to: familyMember







