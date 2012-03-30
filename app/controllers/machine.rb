class Scmize < Sinatra::Application
  get '/machines' do
    machines = Machine.all
    haml :'machines/index', :locals => {:subtitle => 'Machines', :machines => machines}
  end
  
  get '/machines/new' do
    machine = Machine.new
    haml :'machines/new', :locals => {:subtitle => 'Machines - Create a new one', :machine => machine}
  end
  
  post '/machines' do
    Machine.create_and_save params[:machine]
    redirect to('/machines')
  end

  get '/machines/:id/edit' do |id|
    machine = Machine.first(:conditions => { :id => id })

    haml :'machines/edit', :locals => {:subtitle => 'Machines - Edit', :machine => machine}
  end

  post '/machines/:id' do |id|
    Machine.update_and_save(id, params[:machine])
    redirect to('/machines')
  end
end
