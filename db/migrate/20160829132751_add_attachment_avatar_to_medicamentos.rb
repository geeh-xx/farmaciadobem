class AddAttachmentAvatarToMedicamentos < ActiveRecord::Migration
  def self.up
    change_table :medicamentos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :medicamentos, :avatar
  end
end
