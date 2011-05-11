class Item
  include MongoMapper::Document

  key :quantidade, Integer
  belongs_to :lista
  belongs_to :produto

  validates_presence_of :quantidade, :lista, :produto
  validates_numericality_of :quantidade, :greater_than => 0


  def valor
    self.quantidade * self.produto.valor
  end  
end
