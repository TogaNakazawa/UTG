class AddImageNameToUsers < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :users,:image_name,:string, default:"default_user.jpeg"
  end
end
