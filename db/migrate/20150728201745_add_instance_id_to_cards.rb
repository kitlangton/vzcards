class AddInstanceIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :instance_id, :string
  end
end
