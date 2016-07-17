class CreateDepoimentos < ActiveRecord::Migration
  def change
    create_table :depoimentos do |t|
      t.text :depoimento
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
