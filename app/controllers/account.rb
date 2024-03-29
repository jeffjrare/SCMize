class Scmize < Sinatra::Application
  get '/signup' do
    haml :'accounts/new', :locals => {:subtitle => 'Nouveau compte'}
  end

  get '/account' do
    user = current_user
    haml :'users/show', :locals => {:subtitle => 'Mon compte', :user => user}
  end

  post '/signup' do
    account = Account.create_and_save(params[:account])
    user = account.users.first

    if user
      session[:user_id] = user.id
      session[:account_id] = account.id

      redirect to('/overview')
    else
      redirect to('/')
    end

  end
end
