class AddBuildingDescriptionColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :buildings, :description, :string
  end
end
