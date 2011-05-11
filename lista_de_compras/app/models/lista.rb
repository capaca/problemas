class Lista
  include MongoMapper::Document

  many :items, :dependent => :destroy
  key :descricao, String

  validates_presence_of :descricao

  def total
    total = 0.0
    self.items.each do |item|
      total += item.valor
    end
    total
  end
end
