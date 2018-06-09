class AddUserIdToPosts < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :posts, :user_id, :integer  
  end
end
