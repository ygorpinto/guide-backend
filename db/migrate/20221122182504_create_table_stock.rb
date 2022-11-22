class CreateTableStock < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.date :date
      t.float :price
      t.string :name
      t.timestamps
    end
  end
end
