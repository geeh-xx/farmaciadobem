class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :medicamento, index: true, foreign_key: true
      t.belongs_to :carrinho, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
