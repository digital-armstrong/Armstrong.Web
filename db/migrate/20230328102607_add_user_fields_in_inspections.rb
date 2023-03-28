class AddUserFieldsInInspections < ActiveRecord::Migration[7.0]
  def change
      change_table(:inspections) do |t|
        t.references :creator_user, foreign_key: { to_table: 'users' }
        t.references :assigned_user, foreign_key: { to_table: 'users' }
    end
  end
end
