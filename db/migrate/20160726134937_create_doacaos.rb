class CreateDoacaos < ActiveRecord::Migration
  def change
    create_table :doacaos do |t|
      t.string :tipo
      t.string :local_doacao
      t.string :data_doacao
      t.string :horario_doacao
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
