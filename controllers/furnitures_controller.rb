require './models/furniture'

get '/' do

    furnitures = all_furnitures()
    count = 0
    erb :'furnitures/index', locals:{
        furnitures: furnitures,
        count: count
    }
end

get '/furnitures/search' do
    item = params['item']
    furniturn = run_sql("SELECT * FROM furnitures WHERE item = $1", [item])
    erb :'/furnitures/search', locals: {
        furniture: furniture
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
    run_sql("UPDATE furnitures SET price = $2 WHERE id = $1", [id, price])
    redirect '/'
end

put '/furnitures/:id/:count' do
    id = params['id']
    quantity = params['quantity']
    update_stock(id)
    count = params['count'].to_i
    count += 1
    p count

    furnitures = guest_furnitures()

    erb :'/sessions/guest', locals:{
        furnitures: furnitures,
        count: count
    }

    redirect '/sessions/guest'
end
