class AddDataToSolicitacaos < ActiveRecord::Migration
  def change
    add_column :solicitacaos, :data_criacao, :date
  end
end
