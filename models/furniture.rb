def all_furnitures
  run_sql("SELECT * FROM furnitures ORDER BY id")
end

def guest_furnitures
  run_sql("SELECT * FROM furnitures WHERE price > 0 ORDER BY id;")
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

def addtocart_update_stock(id)
  run_sql("UPDATE furnitures SET quantity = quantity - 1  WHERE id = $1", [id])
end

def set_price(id, price)
  run_sql("UPDATE furnitures SET price = $2 WHERE id = $1", [id, price])
end

def data_entry_furniture(item, photo_url, quantity, price)
  run_sql("INSERT INTO furnitures (item, photo_url, quantity, price)
  VALUES ($1, $2, $3, $4)", [item, photo_url, quantity, price])
end

def find_furniture_by_id(id)
  users = run_sql("SELECT * FROM furnitures WHERE id = $1", [id])[0]
end

def create_user_cart (user_name)
  run_sql("SELECT * FROM carts WHERE user_name = $1", [user_name])
end

def delete_item_in_cart(id)
  run_sql("DELETE FROM carts WHERE id = $1", [id])
end

def create_temp_cart(user_name)
  run_sql("SELECT item_id, SUM(quantity)
  INTO tempcarts
  FROM carts
  WHERE user_name = $1
  GROUP BY item_id", [user_name])
end
