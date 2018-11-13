class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :genre, null: false, default: ""
      t.string :author, null: false, default: ""
      t.string :image, null: false, default: ""
      t.string :title, null: false, default: ""
      t.string :publisher, null: false, default: ""
      t.string :year, null: false, default: ""
      t.timestamps
    end
  end
end