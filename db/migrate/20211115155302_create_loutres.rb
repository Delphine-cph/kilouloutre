class CreateLoutres < ActiveRecord::Migration[6.0]
  def change
    create_table :loutres do |t|
      t.string :name
      t.string :personality
      t.string :event
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
