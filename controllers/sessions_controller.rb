get '/sessions/new' do
    erb :'/sessions/new'
end

post '/sessions' do

    email = params['email']
    password = params['password']

    user = run_sql("SELECT * FROM users WHERE email = $1", [email])
    if user.to_a.count > 0 
        user = user[0]
    else 
        nil
    end
    if user && BCrypt::Password.new(user['password_digest']) == password
        session['user_id'] = user['id'] 
    else
        "You are not a user"
    end
    redirect '/'

end

# delete '/sessions' do
#     session['user_id'] = nil
#     redirect '/'
# end