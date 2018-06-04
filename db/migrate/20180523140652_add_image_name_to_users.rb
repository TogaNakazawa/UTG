class AddImageNameToUsers < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :users,:image_name,:string, default:"default_user.jpeg"
    add_column :users,:image_cover_name,:string, default:"default_cover_image.jpg"
  end
end
