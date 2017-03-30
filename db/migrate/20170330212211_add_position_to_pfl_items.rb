class AddPositionToPflItems < ActiveRecord::Migration[5.0]
  def change
    add_column :pfl_items, :position, :integer
  end
end
