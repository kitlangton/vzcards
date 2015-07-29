class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :alias
      t.string :alias2
      t.string :manufacturer
      t.string :sku

      t.timestamps null: false
    end
  end
end
