class ChangeCreatorUserInInspections < ActiveRecord::Migration[7.0]
  def up
    change_column :inspections, :creator_user_id, :integer, :null => false
    change_column :inspections, :state, :string, default: "sent", :null => false
  end

  def down
    change_column :inspections, :creator_user_id, :integer
    change_column :inspections, :state, :string
  end
end
