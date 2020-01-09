class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :studio
      t.string :genre
      t.string :submitted_by
      t.text :description
      t.integer :user_id
      t.integer :studio_id
    end
  end
end
