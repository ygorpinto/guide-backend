class CreateTableStock < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.timestamp :date
      t.float :price
      t.string :symbol
      t.timestamps
    end
  end
end
