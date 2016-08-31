class AddActiveToCarrinhos < ActiveRecord::Migration
  def change
    add_column :carrinhos, :active, :integer, :default => 0
  end
end
