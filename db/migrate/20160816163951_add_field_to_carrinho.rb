class AddFieldToCarrinho < ActiveRecord::Migration
  def change
    add_reference :carrinhos, :user, index: true, foreign_key: true
  end
end
