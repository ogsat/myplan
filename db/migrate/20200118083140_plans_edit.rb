class PlansEdit < ActiveRecord::Migration[5.0]
  def change
    remove_column :plans, :post_id, :integer
  end
end
