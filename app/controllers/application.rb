class Scmize < Sinatra::Application
  # 404
  not_found do
    haml :'404', :locals => {:subtitle => 'Not found'}
  end
  
  # route: map root
  get '/' do
    products = Product.all(:order => [ :created_at.desc ], :limit => 3)
    productCount = Product.all.count

    machines = Machine.all(:order => [ :created_at.desc ], :limit => 3)
    machineCount = Machine.all.count

    simulations = Simulation.all(:order => [ :created_at.desc ], :limit => 3)
    simulationCount = Simulation.all.count

    haml :index, :locals => { :subtitle => 'Overview', :products => products, :machines => machines, :simulations => simulations, :productCount => productCount, :machineCount => machineCount, :simulationCount => simulationCount }
  end
end