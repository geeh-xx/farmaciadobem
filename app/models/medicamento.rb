class Medicamento < ActiveRecord::Base
  belongs_to :doacao
  has_many :items, dependent: :destroy

  before_destroy :ensure_not_referenced_by_any_item

  private
    def ensure_not_referenced_by_any_item
      if items.empty?
        return true
      else
        errors.add(:base, 'Itens presentes')
        return false
      end
    end
end
