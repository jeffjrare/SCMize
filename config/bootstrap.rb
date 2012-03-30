require 'sinatra'
require "sinatra/reloader"
require 'sinatra/minify'
require 'data_mapper' 
require 'haml'

# Custom libs
require_relative '../libs/base'

# Controllers & models
Dir.glob(File.join(Pathname.new(File.dirname(__FILE__)).parent.to_s, "app/**/*.rb")).each{ |file| require_relative file }

# Orm
require_relative 'db'

# App core definition
require_relative 'app'