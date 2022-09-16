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
    
    # carts = run_sql("SELECT item_id, COUNT(*) FROM carts GROUP BY item_id")
   carts = run_sql("SELECT * FROM 
    (SELECT DISTINCT item_id, item, photo_url, price from carts WHERE user_name = $1) as temp1
    LEFT JOIN (SELECT item_id, COUNT (*) FROM carts  WHERE user_name = $1 GROUP BY item_id) as temp2
    ON temp1.item_id = temp2.item_id", [user_name]
   )

  
    #     carts = run_sql("SELECT * FROM tempcarts LEFT JOIN furnitures ON tempcarts.item_id = furnitures.id")
    
    p carts.to_a.to_s
    # tempcarts = create_temp_cart(user_name)
    # carts = run_sql("SELECT * FROM tempcarts LEFT JOIN furnitures ON tempcarts.item_id = furnitures.id")

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
    user_name = current_user['user_name']
    count = run_sql("SELECT COUNT(*) AS abc FROM carts WHERE user_name = $1",[user_name])[0]
    count = count['abc']
    
    
    erb :'/sessions/guest', locals: {
        count: count,
        furnitures: furnitures
    }
end

get '/sessions/checkout' do
    "Thank you for your shopping!"
end


delete '/sessions/:item_id' do
    item_id = params['item_id']
    user_name = current_user['user_name']
    p item_id
    p user_name
    run_sql("DELETE FROM carts WHERE item_id = $1 AND user_name= $2", [item_id, user_name])
    redirect '/sessions/cart'
end

get '/sessions/furnitures/donate' do
    erb :'/furnitures/donate'
end

