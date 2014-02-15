class AddSalesGroupIdToSalesReps < ActiveRecord::Migration
  def change
    change_table :sales_reps do |t|
      t.integer :sales_group_id
    end

    add_index :sales_reps, :sales_group_id
  end
end
