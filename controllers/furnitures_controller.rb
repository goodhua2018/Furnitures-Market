require './models/furniture'

get '/' do

    furnitures = all_furnitures()
    
    erb :'furnitures/index', locals:{
        furnitures: furnitures,
        
    }
end

get '/furnitures/search' do
    item = params['item']
    p item.class
    item = "%#{item}%"
    p item
    furnitures = run_sql("SELECT * FROM furnitures WHERE item ILIKE $1", [item])
    p furnitures

    erb :'/furnitures/search', locals: {
        furnitures: furnitures
    }
end

get '/furnitures/donate' do
    erb :'/furnitures/donate'
end

post '/furnitures/' do
    item = params['item']
    photo_url = params['photo_url']
    quantity = params['quantity']
    donate_furniture(item, photo_url, quantity)
    # add 
    redirect '/'
    
end

get '/furnitures/:id/update' do
    id = params['id']
    furniture = get_furniture(id)
    # p furniture.to_a.to_s 
    erb :'/furnitures/update', locals: {
        furniture: furniture
    }
end

put '/furnitures/:id' do
    id = params['id']
    item = params['item']
    photo_url = params['photo_url']
    quantity = params['quantity']
    update_furniture(id, item, photo_url, quantity)
    redirect '/'
end

delete '/furnitures/:id' do
    id = params['id']
    delete_furniture(id)
    redirect '/'
end


get '/furnitures/:id/setprice' do
    id = params['id']
    furniture = get_furniture(id)
    # p furniture.to_a.to_s 
    erb :'/furnitures/setprice', locals: {
        furniture: furniture
    }
end

put '/furnitures/:id/setprice' do
    id = params['id']
   
    price = params['price']
    set_price(id, price)
    redirect '/'
end

put '/furnitures/:id/:user_name/addtocart' do
    id = params['id']
    user_name = params['user_name']
    p user_name

    quantity = params['quantity']
    update_stock(id)
    

    furnitures = guest_furnitures()

    cartfurniture = find_furniture_by_id(id)
    p cartfurniture
    p item = cartfurniture['item']
    p photo_url = cartfurniture['photo_url']
    p price = cartfurniture['price']

    run_sql("INSERT INTO carts (user_name, item, photo_url, price, quantity) VALUES ($1, $2, $3, $4, 1)", [user_name, item, photo_url, price])

    erb :'/sessions/guest', locals:{
        furnitures: furnitures,
    }

    redirect '/sessions/guest'
end

get '/furnitures/datamanage' do
    erb :'/furnitures/datamanage'
end

post '/furnitures/staff' do

    item = params['item']
    photo_url = params['photo_url']
    quantity = params['quantity']
    price = params['price']
    data_entry_furniture(item, photo_url, quantity, price)
    # add 
    redirect '/'
    
end
