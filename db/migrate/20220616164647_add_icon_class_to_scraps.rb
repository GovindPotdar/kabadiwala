class AddIconClassToScraps < ActiveRecord::Migration[7.0]
  def change
    add_column :scraps, :icon_class, :string
  end
end
