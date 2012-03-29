class Scmize < Sinatra::Application
  get '/products' do
    products = Product.all

    product = Product.new
    product.name = 'Fiber composite A4'
    product.identifier = 'FCA1'
    products << product

    haml :'products/index', :locals => {:subtitle => 'Products', :products => products}
  end
  
  get '/products/new' do
    product = Product.new
    haml :'products/new', :locals => {:subtitle => 'Products', :product => product}
  end
  
  post '/products' do
    Product.create_and_save(current_account, params[:product])
    redirect to('/products')
  end

  get '/products/:id/edit' do |id|
    product = Product.first(:conditions => { :id => id })
    haml :'products/edit', :locals => {:subtitle => 'Products', :product => product}
  end

  post '/products/:id' do |id|
    Product.update_and_save(id, params[:product])
    redirect to('/products')
  end
end
