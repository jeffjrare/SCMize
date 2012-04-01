class Product
  include DataMapper::Resource

  property :id,         Serial 
  property :identifier,      String 
  property :name,      String
  property :type,      String
  property :created_at, DateTime

  def self.create_and_save properties
    product = Product.create :name => properties[:name],
                             :identifier => properties[:identifier],
                             :type => properties[:type]
    
    if properties[:parts]
      Bom.all(:conditions => {:parent_product_id => product.id}).destroy!

      properties[:parts].each do |part|
        Bom.create_and_save(product.id, part, properties[:partsQty][part], properties[:partsUom][part])
      end
    end

    product
  end

  def self.update_and_save id, properties
    product = Product.get(id)

    product.update :name => properties[:name],
                             :identifier => properties[:identifier],
                             :type => properties[:type]
    
    if properties[:parts]
      Bom.all(:conditions => {:parent_product_id => product.id}).destroy!

      properties[:parts].each do |part|
        Bom.create_and_save(product.id, part, properties[:partsQty][part], properties[:partsUom][part])
      end
    end

    product
  end  

  def self.options_for field
    return case field 
      when 'type'
       ['raw', 'finish', 'component']
    end
  end

  def in_bom? parent_id, part_id
    Bom.first(:conditions => {:parent_product_id => parent_id, :part_product_id => part_id})
  end
end
