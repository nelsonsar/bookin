class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :guid, null: false, :limit 36
      t.string :name, null: false
      t.string :author, null: false
      t.string :tags, null: false
      t.timestamps null: false
    end
  end
end
