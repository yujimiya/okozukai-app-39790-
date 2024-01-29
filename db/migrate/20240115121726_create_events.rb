class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :help_date, null: false
      t.references :user, foreign_key: true
      t.boolean :marked, default: false
      t.timestamps
    end
  end
end
