require 'sinatra'
require "sinatra/reloader"
require 'sinatra/minify'
require 'data_mapper' 
require 'haml'
require "rack/csrf"

class Scmize < Sinatra::Application
  include Sinatra::Minify
  use Rack::MethodOverride

  set :app_file, __FILE__
  set :haml, :layout => :'layouts/app'
  set :raise_errors, false
  set :root, Pathname.new(File.dirname(__FILE__)).parent.to_s
  set :title, 'Scmize'
  set :views, Proc.new { File.join(root, "app/views") }
  set :environment, :development
  enable :sessions
  enable :method_override

  # Sinatra-minify
  set :minify_config, 'assets.yml'
  set :js_path, 'public/javascripts'
  set :js_url,  '/javascripts'
  set :css_path, 'public/stylesheets'
  set :css_url,  '/stylesheets'

  configure :development do |config|
    register Sinatra::Reloader
    config.also_reload "app/controllers/*.rb"
    config.also_reload "app/models/*.rb"
    config.also_reload "libs/*.rb"
    set :dump_errors, true
    set :show_exceptions, true

    use Rack::Session::Cookie, :secret => "25CCEAE5083C4919DA44FACE551B336B931E5FBFC376A550E825767C1B1EBDB0"
    use Rack::Csrf, :raise => true
  end

  configure :production do
    enable :force_minify
    set :haml, { :ugly => true }
    set :clean_trace, true
    use Rack::Session::Cookie, :secret => "25CCEAE5083C4919DA44FACE551B336B931E5FBFC376A550E825767C1B1EBDB0"
    use Rack::Csrf, :raise => true
  end
  
  helpers do
    include Rack::Utils
    alias_method :h, :escape_html

    def csrf_token
      Rack::Csrf.csrf_token(env)
    end

    def csrf_tag
      Rack::Csrf.csrf_tag(env)
    end
  end

  # Custom methods
  def current_domain; "scimze.local/"; end
end