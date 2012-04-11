class Bom
  include DataMapper::Resource

  property :id,         Serial 
  property :parent_product_id, Integer
  property :part_product_id, Integer
  property :quantities, Float 
  property :uom,      String
  property :created_at, DateTime

  belongs_to :parent_product, 'Product', :child_key => [ :parent_product_id ]
  belongs_to :part_product, 'Product', :child_key => [ :part_product_id ]
  #has 1, :parent_product, {:through=>:product, :via=>:parent_product_id, :key=>true}
  #has 1, :part_product, {:through=>:product, :via=>:part_product_id, :key=>true}

  def self.create_and_save parent_id, product_id, quantities, uom
    bom = Bom.new :quantities => quantities,
                  :uom => uom,
                  :parent_product_id => parent_id,
                  :part_product_id => product_id

    bom.save

    bom
  end
end
