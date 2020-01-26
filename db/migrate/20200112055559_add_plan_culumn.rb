class AddPlanCulumn < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :plan_id, :integer
    add_column :posts, :plan_date, :string
    add_column :posts, :arrival_time, :string
    add_column :posts, :place_image, :string
    add_column :posts, :place_name, :string
  end
end
