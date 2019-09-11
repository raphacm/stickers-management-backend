class CreateStickers < ActiveRecord::Migration[6.0]
  def change
    create_table :stickers do |t|
      t.string :uuid
      t.references :collection, null: false, foreign_key: true
      t.integer :number
      t.integer :quantity

      t.timestamps
    end
  end
end
