class CreatePosts < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :studio
      t.string :genre
      t.text :description
      t.integer :user_id
      t.integer :studio_id
    end
  end
end
