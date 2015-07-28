class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, index: true
      t.references :template, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
