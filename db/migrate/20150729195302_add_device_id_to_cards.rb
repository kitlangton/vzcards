class AddDeviceIdToCards < ActiveRecord::Migration
  def change
    add_reference :cards, :device, index: true, foreign_key: true
  end
end
