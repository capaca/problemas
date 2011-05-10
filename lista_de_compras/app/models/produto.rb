class Produto
  include MongoMapper::Document

  key :nome, String
  key :descricao, String
  key :valor, Float

end
