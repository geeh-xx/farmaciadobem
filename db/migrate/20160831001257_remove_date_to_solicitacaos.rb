class RemoveDateToSolicitacaos < ActiveRecord::Migration
  def change
    remove_column :solicitacaos, :data_criacao, :date
  end
end
