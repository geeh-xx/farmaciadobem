class AddDateToDoacaos < ActiveRecord::Migration
  def change
    add_column :doacaos, :data_criacao, :date
  end
end
