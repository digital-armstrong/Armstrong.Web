class ChangeInspectionsTable < ActiveRecord::Migration[7.0]
  def up
    rename_column :inspections, :inspection_conclusion, :conclusion
    rename_column :inspections, :inspection_date, :conclusion_date
    remove_column :inspections, :user_id
    add_column :inspections, :state, :string
  end

  def down
    rename_column :inspections, :conclusion, :inspection_conclusion
    rename_column :inspections, :conclusion_date, :inspection_date
    add_column :inspections, :user_id, :bigint
    remove_column :inspections, :state
  end
end
