class Medicamento < ActiveRecord::Base
  enum role: [:solicitado, :entregue]
  belongs_to :doacao
  has_many :items, dependent: :destroy

  before_destroy :ensure_not_referenced_by_any_item

  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/



  def retorna_status
    if active == 0
      "Desativo"
    else
      "Ativo"
    end
  end

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
