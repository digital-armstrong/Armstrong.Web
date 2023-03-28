class AddSupplementaryKitIdForDevice < ActiveRecord::Migration[7.0]
  def up
    add_column :devices, :supplementary_kit_id, :integer
  end

  def down
    remove_column :devices, :supplementary_kit_id
  end
end
