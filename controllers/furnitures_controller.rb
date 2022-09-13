require './models/furniture'

get '/' do

    furnitures = all_furnitures()
    erb :'furnitures/index', locals:{
        furnitures: furnitures,
        count: 0
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

put '/furnitures/:id/:count/cart' do
    id = params['id']
    quantity = params['quantity']
    update_stock(id)
    count = params['count'].to_i
    count += 1
    p count
    
    furnitures = all_furnitures()

    erb :'furnitures/index', locals:{
        furnitures: furnitures,
        count: count
    }

    # redirect '/'
end