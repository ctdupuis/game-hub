class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :name
      t.text :users, array: true, default: []
      t.text :games, array: true, default: []
    end
  end
end
