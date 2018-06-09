class AddImageNameToUsers < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :users,:image_name,:string, default:"default_user.jpeg"
    add_column :users,:image_cover_name,:string, default:"default_cover_image.jpg"
    add_column :groups,:group_image_name,:string, default:"group_default_image.jpeg"
  end
end
