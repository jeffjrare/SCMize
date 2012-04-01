require 'data_mapper' 

desc "Builds the minified CSS and JS assets."
task :minify do
  require_relative 'config/app.rb'
  puts "Building..."

  files = Sinatra::Minify::Package.build(Code)  # <= change this
  files.each { |f| puts " * #{File.basename f}" }
  puts "Construction complete!"
end

desc "Perform automigration" 
task :automigrate do 
  require_relative 'appconfig/.rb'
  DataMapper.auto_migrate!
end 

desc "Perform non destructive automigration" 
task :autoupgrade do 
  require_relative 'config/app.rb'
  DataMapper.auto_upgrade!
end 
