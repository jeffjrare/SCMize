require 'data_mapper' 

namespace :assets do

  desc "Builds the minified CSS and JS assets."
  task :minify do
    require_relative 'config/app.rb'
    puts "Building..."

    files = Sinatra::Minify::Package.build(Code)  # <= change this
    files.each { |f| puts " * #{File.basename f}" }
    puts "Construction complete!"
  end

end

namespace :datamapper do

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

end

namespace :application do

  desc 'Generate and setup a brand new application'
  task :generate do
    # todo: generate a default config/config.yml
  end
  
end