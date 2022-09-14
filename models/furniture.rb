def all_furnitures
    run_sql("SELECT * FROM furnitures ORDER BY id")
end

def donate_furniture(item, photo_url, quantity)
    run_sql("INSERT INTO furnitures (item, photo_url, quantity)
    VALUES ($1, $2, $3)", [item, photo_url, quantity])
end

def get_furniture(id)
    run_sql("SELECT * FROM furnitures WHERE id = $1", [id])[0]
end

def update_furniture(id, item, photo_url, quantity)
    run_sql("UPDATE furnitures SET item = $2, photo_url = $3, quantity = $4 WHERE id = $1", [id, item, photo_url, quantity])
end

def delete_furniture(id)
    run_sql("DELETE FROM furnitures WHERE id = $1", [id])
end

def update_stock(id)
    run_sql("UPDATE furnitures SET quantity = quantity - 1  WHERE id = $1", [id])
end

def set_price(id, price)
    run_sql("UPDATE furnitures SET price = $2 WHERE id = $1", [id, price])
end
