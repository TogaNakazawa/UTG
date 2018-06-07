class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name,null: false
      t.string :member_names, null:false
      t.integer :member_id
      t.boolean :approved, default:false
      t.boolean :from_blocked, default:false
      t.boolean :to_blocked, default:false
      t.integer :from_id, index: true
      t.integer :to_id, index: true
      t.timestamps
    end
  end
end
