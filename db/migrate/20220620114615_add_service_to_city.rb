class AddServiceToCity < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :service, :integer
  end
end
