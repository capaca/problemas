class Produto
  include MongoMapper::Document

  key :nome, String
  key :descricao, String
  key :valor, Float

  validates_presence_of :nome, :valor
  validates_numericality_of :valor, :greater_than => 0


  def label
    return "#{self.nome} - R$ #{self.valor}"
  end
end
