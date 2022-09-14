require './models/user'
require './models/furniture'

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
    redirect '/sessions/guest'
    

end

delete '/sessions' do
    session['user_id'] = nil
    redirect '/'
end

get '/sessions/cart' do
    user_name = current_user['user_name']
    carts = create_user_cart(user_name)
    p carts
    erb :'/sessions/cart', locals: {
        carts: carts
    } 
end

get '/sessions/staff' do
    erb :'/sessions/staff'
end

post '/sessions/staff' do
    email = params['email']
    password = params['password']

    user = find_user_by_email(email)
    if user && BCrypt::Password.new(user['password_digest']) == password
        session['user_id'] = user['id'] 
    else
        "You are not a staff"
    end
    redirect '/'

end

get '/sessions/guest' do
    furnitures = guest_furnitures()
    count = 0
    erb :'/sessions/guest', locals: {
        count: count,
        furnitures: furnitures
    }
end

get '/sessions/checkout' do
    "Thank you for your shopping!"
end

