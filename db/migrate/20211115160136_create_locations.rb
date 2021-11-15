class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.date :date_départ
      t.date :date_arrive
      t.boolean :status
      t.references :user, null: false, foreign_key: true
      t.references :loutre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
