class Scmize < Sinatra::Application
  get '/machines' do
    machines = Machine.all

    machine = Machine.new
    machine.name = 'Binder Grassroot 2000'
    machine.identifier = 'BG200-01-A2'
    machines << machine

    haml :'machines/index', :locals => {:subtitle => 'Machines', :machines => machines}
  end
  
  get '/machines/new' do
    product = Machine.new
    haml :'machines/new', :locals => {:subtitle => 'Machines', :machine => product}
  end
  
  post '/machines' do
    Machine.create_and_save(current_account, params[:machine])
    redirect to('/machines')
  end

  get '/machines/:id/edit' do |id|
    product = Machine.first(:conditions => { :id => id })
    haml :'machines/edit', :locals => {:subtitle => 'Machines', :machine => product}
  end

  post '/machines/:id' do |id|
    Machine.update_and_save(id, params[:machine])
    redirect to('/machines')
  end
end
