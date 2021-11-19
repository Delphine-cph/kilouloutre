class AddTotalPriceToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :total_price, :integer
  end
end
