class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :unit_price, null: false
      t.date :help_date,  null: false
      t.integer :help_count, null: false
      t.integer :total_price
      t.integer :goal_price, null: false
      t.references :user, foreign_keyi: true
      t.timestamps
    end
  end
end
