class CreatePickupAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :pickup_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
