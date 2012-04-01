class Uom
  include DataMapper::Resource

  property :id,         Serial 
  property :identifier,      String 
  property :name,      String   
  property :created_at, DateTime
  
  
  def self.create_and_save properties
    uom = Uom.create :name => properties[:name],
                             :identifier => properties[:identifier]

    uom
  end

end
