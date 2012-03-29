class Scmize < Sinatra::Application
  get '/simulations' do
    simulations = Simulation.all
    haml :'simulations/index', :locals => {:subtitle => 'Simulations', :simulations => simulations}
  end
  
  get '/simulations/new' do
    product = Simulation.new
    haml :'simulations/new', :locals => {:subtitle => 'Simulations', :simulation => product}
  end
  
  post '/simulations' do
    Simulation.create_and_save(current_account, params[:simulation])
    redirect to('/simulations')
  end

  get '/simulations/:id/edit' do |id|
    product = Simulation.first(:conditions => { :id => id })
    haml :'simulations/edit', :locals => {:subtitle => 'Simulations', :simulation => product}
  end

  post '/simulations/:id' do |id|
    Simulation.update_and_save(id, params[:simulation])
    redirect to('/simulations')
  end
end
