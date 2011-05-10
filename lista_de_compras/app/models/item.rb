class Item
  include MongoMapper::Document

  key :quantidade, Integer
  belongs_to :lista
  belongs_to :produto

end
