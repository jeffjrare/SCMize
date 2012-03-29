class Scmize < Sinatra::Application
  get '/about' do
    haml :'statics/about', :locals => {:subtitle => 'About'}
  end

  get '/contact' do
    haml :'statics/contact', :locals => {:subtitle => 'Contact'}
  end
end
