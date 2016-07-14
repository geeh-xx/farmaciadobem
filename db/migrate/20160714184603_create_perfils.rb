class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
