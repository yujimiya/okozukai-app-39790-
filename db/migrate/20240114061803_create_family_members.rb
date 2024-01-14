class CreateFamilyMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :family_members do |t|
      t.string :family_name,     null: false
      t.timestamps
    end
  end
end
