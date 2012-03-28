require 'sinatra'
#require "sinatra/reloader"
require 'sinatra/minify'
require 'data_mapper' 
require 'haml'
#require "rack/csrf"

DataMapper::Logger.new(STDOUT, :debug)
#DataMapper::Model.raise_on_save_failure = true
DataMapper.setup(:default, 'mysql://scimze::scmize666@localhost/scmize')

Dir.glob(File.join(File.dirname(__FILE__), "app/**/*.rb")).each{ |file| require file }
require_relative 'libs/base'

DataMapper.finalize.auto_upgrade!

class Scmize < Sinatra::Application
  include Sinatra::Minify

  set :title, 'Scmize'
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "app/views") }
  set :app_file, __FILE__
  set :raise_errors, false if production?
  set :haml, :layout => :'layouts/app'
  enable :sessions

  set :js_path, 'public/javascripts'
  set :js_url,  '/javascripts'

  set :css_path, 'public/stylesheets'
  set :css_url,  '/stylesheets'

  configure :development do |config|
    use Sinatra::ShowExceptions
    #register Sinatra::Reloader
    #config.also_reload "app/controllers/*.rb"
    #config.also_reload "app/models/*.rb"
    #set :logging, :true
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

  before do
    @user = User.first(:conditions => {:id => session[:user_id]}) if session[:user_id]
    @account = @user.account if @user
  end

  not_found do
    #haml :'404', :locals => {:title_part => 'Page introuvable'}
  end
  
  get '/' do
    haml :index, :locals => { :title_part => 'Accueil' }
  end

  def current_domain
    "scimze.local/"
  end

  def current_account
    @account
  end

  def current_user
    @user
  end
end