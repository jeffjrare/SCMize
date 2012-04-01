class Simulation
  include DataMapper::Resource

  property :id,         Serial 
  property :identifier,      String 
  property :name,      String   
  property :created_at, DateTime
  
  belongs_to :machine, :key =>true
  belongs_to :product, :key =>true
  
  def self.create_and_save properties
    simulation = Simulation.new  :name => properties[:name],
                                 :identifier => properties[:identifier]

    simulation.machine = Machine.first(:conditions => { :id => properties[:machine_id]})
    simulation.product = Product.first(:conditions => { :id => properties[:product_id]})
    simulation.save

    simulation
  end
end
