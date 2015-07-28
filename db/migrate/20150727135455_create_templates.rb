class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :ids_id, index: true

      t.timestamps null: false
    end
  end
end
