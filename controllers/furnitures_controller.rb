

get '/' do

    furnitures = run_sql("SELECT * FROM furnitures ORDER BY id")
    erb :'furnitures/index', locals:{
        furnitures: furnitures
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
    run_sql("INSERT INTO furnitures (item, photo_url, quantity)
    VALUES ($1, $2, $3)", [item, photo_url, quantity])

    # add books
    redirect '/'
    
end

get '/furnitures/:id/update' do
    id = params['id']
    furniture = run_sql("SELECT * FROM furnitures WHERE id = $1", [id])[0]
    p furniture.to_a.to_s
    erb :'/furnitures/update', locals: {
        furniture: furniture
    }
  end

  put '/furnitures/:id' do
    id = params['id']
    item = params['item']
    photo_url = params['photo_url']
    quantity = params['quantity']
    run_sql("UPDATE furnitures SET item = $2, photo_url = $3, quantity = $4 WHERE id = $1", [id, item, photo_url, quantity])
    redirect '/'
  end