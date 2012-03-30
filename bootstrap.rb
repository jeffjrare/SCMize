require 'sinatra'
require "sinatra/reloader"
require 'sinatra/minify'
require 'data_mapper' 
require 'haml'

# Custom libs
require_relative 'libs/base'

# Controllers & models
Dir.glob(File.join(File.dirname(__FILE__), "app/**/*.rb")).each{ |file| require file }

# Orm
require_relative 'config/db'

# App core definition
require_relative 'config/app'