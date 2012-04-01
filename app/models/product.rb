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

    product
  end

  def self.update_and_save id, properties
    product = Product.get(id)
    product.update :name => properties[:name],
                             :identifier => properties[:identifier],
                             :type => properties[:type]

    product
  end  

  def self.options_for field
    return case field 
      when 'type'
       ['raw', 'finish', 'component']
    end
  end
end
