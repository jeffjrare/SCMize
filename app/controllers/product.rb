class Scmize < Sinatra::Application
  before do
    raise request.inspect
    _handleFilter
  end

  get '/products' do
    products = Product.all
    stats = { :all => products.length }

    Product.options_for('type').each do |type|
      stats[type.to_sym] = Product.count(:conditions => { :type => type })
    end

    haml :'products/index', :locals => {:subtitle => 'Products', :products => products, :stats => stats}
  end
  
  get '/products/new' do
    product = Product.new
    products = Product.all(:order => :identifier)
    machines = Machine.all
    uoms = Uom.all(:order => :name)

    haml :'products/new', :locals => {:subtitle => 'Products - Create a new one', :product => product, :products => products, :machines => machines, :uoms => uoms}
  end

  post '/products' do
    Product.create_and_save(params[:product])
    redirect to('/products')
  end

  get '/products/:id/edit' do |id|
    product = Product.first(:conditions => { :id => id })
    products = Product.all(:conditions => ["id != #{id}"], :order => :identifier)
    machines = Machine.all
    uoms = Uom.all(:order => :name)

    haml :'products/edit', :locals => {:subtitle => 'Products - Edit', :product => product, :products => products, :machines => machines, :uoms => uoms}
  end

  delete '/products/:id' do |id|
    product = Product.first(:conditions => { :id => id }).destroy
    redirect to('/products')
  end

  post '/products/:id/clone' do |id|
    product = Product.clone(id)
    redirect to("/products/#{product.id}/edit")
  end

  post '/products/:id' do |id|
    Product.update_and_save(id, params[:product])
    redirect to('/products')
  end

  def _handleFilter
    Sinatra::AppSession::Filtering.set :product, params[:filtering] if params[:filtering]
    Sinatra::AppSession::View.set :product, params[:view] if params[:view]

    @productView = Sinatra::AppSession::View.get :product
    @productFiltering = Sinatra::AppSession::Filtering.get :product
  end
end
