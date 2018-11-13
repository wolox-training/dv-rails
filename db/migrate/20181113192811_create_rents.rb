class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.timestamps
    end
  end
end
