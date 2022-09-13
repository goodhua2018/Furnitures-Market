require './models/user'

get '/users/new' do
    erb :'/users/new'
end

post '/users' do
    user_name = params['user_name']
    email = params["email"]
    password = params["password"]

    
    create_user(user_name, email, password)

    redirect '/'
end