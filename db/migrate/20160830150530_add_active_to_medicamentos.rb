class AddActiveToMedicamentos < ActiveRecord::Migration
  def change
    add_column :medicamentos, :active, :integer, :default => 0
  end
end
