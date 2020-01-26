class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.integer :plan_id
      t.string :plan_name
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
