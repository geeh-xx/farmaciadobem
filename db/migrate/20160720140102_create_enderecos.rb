class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :nome
      t.string :rua
      t.string :numero
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :cep
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
