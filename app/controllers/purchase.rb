class CapitalConnect < Sinatra::Application
  get '/purchases' do
    purchases = Purchase.all
    haml :'purchases/index', :locals => {:title_part => 'Achats', :purchases => purchases}
  end
  
  get '/purchases/new' do
    purchase = Purchase.new
    haml :'purchases/new', :locals => {:title_part => 'Achats', :purchase => purchase}
  end
  
  post '/purchases' do
    Purchase.create_and_save(current_account, params[:purchase])
    redirect to('/purchases')
  end

  get '/purchases/:id/edit' do |id|
    purchase = Purchase.first(:conditions => { :id => id })
    haml :'purchases/edit', :locals => {:title_part => 'Achats', :purchase => purchase}
  end

  post '/purchases/:id' do |id|
    Purchase.update_and_save(id, params[:purchase])
    redirect to('/purchases')
  end
end
