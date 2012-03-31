require 'sinatra'
require "sinatra/reloader"
require 'sinatra/minify'
require 'data_mapper' 
require 'haml'
#require "rack/csrf"

class Scmize < Sinatra::Application
  include Sinatra::Minify

  set :app_file, __FILE__
  set :haml, :layout => :'layouts/app'
  set :raise_errors, false if production?
  set :root, Pathname.new(File.dirname(__FILE__)).parent.to_s
  set :title, 'Scmize'
  set :views, Proc.new { File.join(root, "app/views") }
  enable :sessions

  # Sinatra-minify
  set :minify_config, 'assets.yml'
  set :js_path, 'public/javascripts'
  set :js_url,  '/javascripts'
  set :css_path, 'public/stylesheets'
  set :css_url,  '/stylesheets'

  configure :development do |config|
    use Sinatra::ShowExceptions
    register Sinatra::Reloader
    config.also_reload "app/controllers/*.rb"
    config.also_reload "app/models/*.rb"

    #use Rack::Session::Cookie, :secret => "25CCEAE5083C4919DA44FACE551B336B931E5FBFC376A550E825767C1B1EBDB0"
    #use Rack::Csrf, :raise => true
  end

  configure :production do
    enable :force_minify
    set :haml, { :ugly => true }
    set :clean_trace, true
    #use Rack::Session::Cookie, :secret => "25CCEAE5083C4919DA44FACE551B336B931E5FBFC376A550E825767C1B1EBDB0"
    #use Rack::Csrf, :raise => true
  end
  
  helpers do
    include Rack::Utils
    alias_method :h, :escape_html

    def csrf_token
      #Rack::Csrf.csrf_token(env)
    end

    def csrf_tag
      #Rack::Csrf.csrf_tag(env)
    end
  end

  # Session loading
  before do
    @user = User.first(:conditions => {:id => session[:user_id]}) if session[:user_id]
    @account = @user.account if @user
  end

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

  # Custom methods
  def current_domain; "scimze.local/"; end
  def current_account; @account; end;
  def current_user; @user; end;
end