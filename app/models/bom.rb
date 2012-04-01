class Bom
  include DataMapper::Resource

  property :id,         Serial 
  property :parent_product_id, Integer
  property :part_product_id, Integer
  property :quantities, Float 
  property :uom,      String
  property :created_at, DateTime

  def self.create_and_save parent_id, product_id, quantities, uom
    bom = Bom.new :quantities => quantities,
                  :uom => uom,
                  :parent_product_id => parent_id,
                  :part_product_id => product_id

    bom.save

    bom
  end
end
