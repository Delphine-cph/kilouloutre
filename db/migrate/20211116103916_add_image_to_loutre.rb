class AddImageToLoutre < ActiveRecord::Migration[6.0]
  def change
    add_column :loutres, :image, :string
  end
end
