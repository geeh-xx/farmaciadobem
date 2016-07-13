class CreateMedicamentos < ActiveRecord::Migration
  def change
    create_table :medicamentos do |t|
      t.string :nome
      t.string :tipo
      t.string :validade

      t.timestamps null: false
    end
  end
end
