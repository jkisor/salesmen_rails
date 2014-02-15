class AddLocationIdToSalesReps < ActiveRecord::Migration
  def change
    change_table :sales_reps do |t|
      t.integer :location_id
    end

    add_index :sales_reps, :location_id
  end
end
