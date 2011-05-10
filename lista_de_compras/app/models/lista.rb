class Lista
  include MongoMapper::Document

  many :items
  key :descricao, String

end
