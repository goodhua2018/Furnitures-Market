get '/users/new' do
    erb :'/users/new'
end

post '/users' do
    user_name = params['user_name']
    email = params["email"]
    password = params["password"]

    password_digest = BCrypt::Password.create(password)
    run_sql("INSERT INTO users(user_name, email, password_digest) VALUES($1, $2, $3)", [user_name, email, password_digest])

    redirect '/'
end