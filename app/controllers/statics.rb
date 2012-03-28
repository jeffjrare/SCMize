class CapitalConnect < Sinatra::Application
  get '/a-propos' do
    haml :'statics/about', :locals => {:title_part => '&Agrave; propos'}
  end

  get '/contact' do
    haml :'statics/contact', :locals => {:title_part => 'Contact'}
  end
end
