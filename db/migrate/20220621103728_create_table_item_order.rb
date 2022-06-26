class CreateTableItemOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :items_orders,id:false do |t|
      t.references :item, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      # t.timestamps
    end
  end
end
