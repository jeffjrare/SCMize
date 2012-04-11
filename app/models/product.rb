class Product
  include DataMapper::Resource

  property :id,         Serial 
  property :identifier,      String 
  property :name,      String
  property :type,      String
  property :created_at, DateTime

  has n, :simulations
  #has n, :parts, :through => :products, :child_key => :part_product_id
  has n, :boms, :child_key => [ :parent_product_id ]

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

  def self.clone id
    product = Product.first(:conditions => { :id => id })

    productCloned = Product.create :name => "#{product.name} (Cloned)",
                                   :identifier => "#{product.identifier}-CLONED",
                                   :type => product.type

    productCloned
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
    return case field.to_sym
      when :type
       ['raw', 'finished', 'component', 'other']
    end
  end

  def in_bom? parent_id, part_id
    Bom.first(:conditions => {:parent_product_id => parent_id, :part_product_id => part_id})
  end

  def placeholder field
    return case field
      when :identifier
        'Ex: PRD0014'
    end
  end
end
