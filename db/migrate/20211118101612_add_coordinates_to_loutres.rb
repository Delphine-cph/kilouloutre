class AddCoordinatesToLoutres < ActiveRecord::Migration[6.0]
  def change
    add_column :loutres, :latitude, :float
    add_column :loutres, :longitude, :float
  end
end
