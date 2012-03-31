class Scmize < Sinatra::Application
  get '/simulations' do
    simulations = Simulation.all
    haml :'simulations/index', :locals => {:subtitle => 'Simulations', :simulations => simulations}
  end
  
  get '/simulations/new' do
    simulation = Simulation.new
    machines = Machine.all
    products = Product.all

    haml :'simulations/new', :locals => {:subtitle => 'Simulations - Create a new one', :simulation => simulation, :machines => machines, :products => products}
  end
  
  post '/simulations' do
    Simulation.create_and_save(params[:simulation])
    redirect to('/simulations')
  end

  get '/simulations/:id/edit' do |id|
    simulation = Simulation.first(:conditions => { :id => id })
    haml :'simulations/edit', :locals => {:subtitle => 'Simulations - Edit', :simulation => simulation}
  end

  post '/simulations/:id' do |id|
    Simulation.update_and_save(id, params[:simulation])
    redirect to('/simulations')
  end
end
