class CapitalConnect < Sinatra::Application
  get '/overview' do
    haml :'overview', :locals => {:title_part => 'Tableau de bord'}
  end

  post '/texts/add' do
    content_type :json

    user = get_current_user
    text = Text.create_and_save(user, params[:text])

    { :data => text, :result => true, :html => haml(:'texts/show', :layout => false, :locals => {:text => text}) }.to_json 
  end

  get '/texts/:id/edit' do |id|
    user = get_current_user
    text = Text.find(id.match(/^\d+/).to_s.to_i)

    session[:current_text_id] = text.id
    
    haml :'texts/edit', :locals => {:title_part => 'Modifier un texte', :text => text, :user => get_current_user}
  end

  post '/texts/:id/update' do |id|
    content_type :json

    text = Text.update_and_save(get_current_user, id, params[:text])

    { :data => text, :result => true }.to_json 
  end

  post '/texts/:id/destroy' do |id|
    content_type :json

    user = get_current_user
    text = Text.find(id.match(/^\d+/).to_s.to_i).destroy

    { :data => text, :result => true }.to_json 
  end
end
