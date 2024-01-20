class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :unit_price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
