class AddAttributesToCards < ActiveRecord::Migration
  def change
    add_column :cards, :alias, :string
    add_column :cards, :alias2, :string
    add_column :cards, :two_year_price, :decimal, precision: 8, scale: 2
    add_column :cards, :full_retail_price, :decimal, precision: 8, scale: 2
    add_column :cards, :effective_date, :date
  end
end
