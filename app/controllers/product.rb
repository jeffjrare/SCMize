class Scmize < Sinatra::Application
  get '/products' do
    products = Product.all

    haml :'products/index', :locals => {:subtitle => 'Products', :products => products}
  end
  
  get '/products/new' do
    product = Product.new
    haml :'products/new', :locals => {:subtitle => 'Products - Create a new one', :product => product}
  end
  
  post '/products' do
    Product.create_and_save(params[:product])
    redirect to('/products')
  end

  get '/products/:id/edit' do |id|
    product = Product.first(:conditions => { :id => id })
    haml :'products/edit', :locals => {:subtitle => 'Products - Edit', :product => product}
  end

  post '/products/:id' do |id|
    Product.update_and_save(id, params[:product])
    redirect to('/products')
  end
end
