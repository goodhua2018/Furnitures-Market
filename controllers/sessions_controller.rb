require './models/user'

get '/sessions/new' do
    erb :'/sessions/new'
end

post '/sessions' do

    email = params['email']
    password = params['password']

    user = find_user_by_email(email)
    if user && BCrypt::Password.new(user['password_digest']) == password
        session['user_id'] = user['id'] 
    else
        "You are not a user"
    end
    redirect '/'

end

delete '/sessions' do
    session['user_id'] = nil
    redirect '/'
end

get '/.sessions/cart' do

    run_sql("INSERT INTO users(user_name, email, password_digest) VALUES($1, $2, $3)", [user_name, email, password_digest])
end