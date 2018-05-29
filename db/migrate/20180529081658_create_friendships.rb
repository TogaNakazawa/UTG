class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
    t.boolean :approved, default:false
    t.boolean :from_blocked, default:false
    t.boolean :to_blocked, default:false
    t.integer :from_id, index: true
    t.integer :to_id, index: true
    t.integer :common_lessons, default:0
    t.timestamps
    end
  end
end
