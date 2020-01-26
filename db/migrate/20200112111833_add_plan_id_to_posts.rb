class AddPlanIdToPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :plans, :plan_id, :integer
  end
end
