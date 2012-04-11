class Machine
  include DataMapper::Resource

  property :id,         Serial 
  property :identifier,      String 
  property :name,      String
  property :type, String
  property :labor, Float, :required => false
  property :labor_hourly_rate, Float, :required => false
  property :maintenance_cost, Float, :required => false
  property :maintenance_time, Float, :required => false
  property :base_setup_time, Float, :required => false
  property :created_at, DateTime
  
  has n, :simulations
  
  def self.create_and_save properties
    machine = Machine.create :name => properties[:name],
                             :identifier => properties[:identifier],
                             :type => properties[:type],
                             :labor => !properties[:labor].empty? ? properties[:labor] : nil,
                             :labor_hourly_rate => !properties[:labor_hourly_rate].empty? ? properties[:labor_hourly_rate] : nil,
                             :maintenance_cost => !properties[:maintenance_cost].empty? ? properties[:maintenance_cost] : nil,
                             :maintenance_time => !properties[:maintenance_time].empty? ? properties[:maintenance_time] : nil,
                             :base_setup_time => !properties[:base_setup_time].empty? ? properties[:base_setup_time] : nil

    machine
  end

  def self.clone id
    machine = Machine.first(:conditions => { :id => id })

    machineCloned = Machine.create :name => "#{machine.name} (Cloned)",
                                   :identifier => "#{machine.identifier}-CLONED",
                                   :type => machine.type,
                                   :labor => machine.labor,
                                   :labor_hourly_rate => machine.labor_hourly_rate,
                                   :maintenance_cost => machine.maintenance_cost,
                                   :maintenance_time => machine.maintenance_time,
                                   :base_setup_time => machine.base_setup_time

    machineCloned
  end  

  def self.update_and_save id, properties
    machine = Machine.get(id)

    machine.update :name => properties[:name],
                   :identifier => properties[:identifier],
                   :type => properties[:type],
                   :labor => properties[:labor],
                   :labor_hourly_rate => properties[:labor_hourly_rate],
                   :maintenance_cost => properties[:maintenance_cost],
                   :maintenance_time => properties[:maintenance_time],
                   :base_setup_time => properties[:base_setup_time]
    
    machine
  end

  def placeholder field
    return case field.to_sym
      when :identifier
        'Ex: LNG00A29'
    end
  end
end