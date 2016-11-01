class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.date :released_on
      t.boolean :active

      t.timestamps null: false
    end
  end
end
