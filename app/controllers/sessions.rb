class CapitalConnect < Sinatra::Application
  get '/login' do
    haml :'sessions/new', :locals => {:title_part => 'Ouvrir une session'}
  end

  get '/logout' do
    session[:user_id] = nil
    session[:account_id] = nil
    redirect to('/')
  end

  post '/login' do
    user = User.login(params[:user])
    
    if user
      session[:account_id] = user.account_id
      session[:user_id] = user.id
      redirect to('/overview')
    else
      redirect to('/')
    end
  end
end
