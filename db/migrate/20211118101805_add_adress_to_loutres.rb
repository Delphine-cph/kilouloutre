class AddAdressToLoutres < ActiveRecord::Migration[6.0]
  def change
    add_column :loutres, :address, :string
  end
end
