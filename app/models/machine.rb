class Machine
  include DataMapper::Resource

  property :id,         Serial 
  property :identifier,      String 
  property :name,      String
  property :type, String
  property :labor, Float
  property :labor_hourly_rate, Float
  property :maintenance_cost, Float
  property :maintenance_time, Float
  property :base_setup_time, Float
  property :created_at, DateTime
  
  
  def self.create_and_save properties
    machine = Machine.create :name => properties[:name],
                             :identifier => properties[:identifier],
                             :type => properties[:type],
                             :labor => properties[:labor],
                             :labor_hourly_rate => properties[:labor_hourly_rate],
                             :maintenance_cost => properties[:maintenance_cost],
                             :maintenance_time => properties[:maintenance_time],
                             :base_setup_time => properties[:base_setup_time]

    machine
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