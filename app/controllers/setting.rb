class Scmize < Sinatra::Application
  get '/settings' do
    redirect '/settings/company'
  end
  
  get '/settings/company' do
    haml :'settings/index', :locals => {:subtitle => 'Settings - Company Profile', :page => 'company'}
  end

  get '/settings/simulation-parameters' do
    haml :'settings/index', :locals => {:subtitle => 'Settings - Simulation Parameters', :page => 'simulation-parameters'}
  end  

  get '/settings/constants' do
    haml :'settings/index', :locals => {:subtitle => 'Settings - Constants Definitions', :page => 'constants'}
  end
end
