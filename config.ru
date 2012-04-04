require 'rubygems'
require 'bundler'

Bundler.require

require File.join(File.dirname(__FILE__), 'config/bootstrap.rb')

log = File.new("sinatra.log", "a+")
$stdout.reopen(log)
$stderr.reopen(log)

run Scmize