class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :content
      t.integer :required_number
      t.integer :founder_id
      t.timestamps
    end
  end
end
