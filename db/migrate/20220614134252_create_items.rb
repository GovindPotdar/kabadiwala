class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.references :scrap, null: false, foreign_key: true
      t.integer :price
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
