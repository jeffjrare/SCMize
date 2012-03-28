class CapitalConnect < Sinatra::Application
  get '/suppliers' do
    suppliers = Supplier.all
    haml :'suppliers/index', :locals => {:title_part => 'Fournisseurs', :suppliers => suppliers}
  end
  
  get '/suppliers/new' do
    supplier = Supplier.new
    haml :'suppliers/new', :locals => {:title_part => 'Fournisseurs', :supplier => supplier}
  end
  
  post '/suppliers' do
    Supplier.create_and_save(current_account, params[:supplier])
    redirect to('/suppliers')
  end

  get '/suppliers/:id/edit' do |id|
    supplier = Supplier.first(:conditions => { :id => id })
    haml :'suppliers/edit', :locals => {:title_part => 'Fournisseurs', :supplier => supplier}
  end

  post '/suppliers/:id' do |id|
    Supplier.update_and_save(id, params[:supplier])
    redirect to('/suppliers')
  end
end
