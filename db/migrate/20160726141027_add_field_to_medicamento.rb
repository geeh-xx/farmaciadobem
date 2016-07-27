class AddFieldToMedicamento < ActiveRecord::Migration
  def change
    add_reference :medicamentos, :doacao, index: true, foreign_key: true
  end
end
