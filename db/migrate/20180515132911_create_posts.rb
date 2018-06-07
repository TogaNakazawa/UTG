class CreatePosts < ActiveRecord::Migration[4.2][5.1]
  def change
    create_table :posts do |t|
      t.string :body
      t.integer :group_id
      t.timestamps
    end
  end
end
