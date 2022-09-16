CREATE DATABASE furnitures_db;
\c furnitures_db

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    user_name TEXT,
    email TEXT,
    password TEXT
);

CREATE TABLE furnitures(
    id SERIAL PRIMARY KEY,
    item TEXT,
    photo_url TEXT,
    quantity INTEGER
);

ALTER TABLE furnitures 
ADD COLUMN 
price FLOAT
CHECK (price >= 0);


INSERT INTO furnitures (item, photo_url)
VALUES ('chiairs', 'ABC');

UPDATE furnitures SET price = 25 WHERE id = 7;


INSERT INTO furnitures (item, photo_url, quantity)
VALUES ('chiairs', 'ABC', 5);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    user_name TEXT,
    email TEXT,
    password_digest TEXT
);

CREATE TABLE sells(
    id SERIAL PRIMARY KEY,
    item TEXT,
    photo_url TEXT,
    quantity INTEGER,
    price FLOAT 
)

CREATE TABLE carts(
    id SERIAL PRIMARY KEY,
    item TEXT,
    quantity INTEGER
);

 ALTER TABLE <table name> 
 ADD CONSTRAINT <name> 
 CHECK(<condition>)

 ALTER TABLE likes
ADD CONSTRAINT unique_likes
UNIQUE(user_id, food_id);

 CREATE TABLE staffs(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    staff_id INTEGER,
    email TEXT,
    password TEXT
);

INSERT INTO staff (first_name, last_name, staff_id, email, password)
VALUES ('chiairs', 'ABC', 5);


SELECT * FROM furnitures WHERE item ILIKE '%s';

SELECT * FROM furnitures WHERE item ILIKE '%c%';
SELECT * FROM furnitures WHERE item ILIKE 'c';

CREATE TABLE carts(
    id SERIAL PRIMARY KEY,
    user_name TEXT,
    item_id TEXT,
    item TEXT,
    photo_url TEXT,
    price FLOAT,
    quantity INTEGER
);

"INSERT INTO carts (user_name, item, photo_url, price, quantity)
VALUES ($1, $2, $3, 1)", [user_name, item, photo_url, price]

ALTER TABLE carts 
ADD COLUMN 
item_id INTEGER;

-- furniture_id in TABLE carts will be the same as id in TABLE furnitures

SELECT * FROM carts WHERE user_name = 'huahua';

 SELECT item_id, SUM(quantity) as sum_quantity
 INTO tempcarts
 FROM carts
 WHERE user_name = 'huahua'
 GROUP BY item_id;






SELECT * FROM tempcarts LEFT JOIN furnitures ON tempcarts.item_id = furnitures.id;


SELECT item_id, SUM(quantity) as sum_quantity
    FROM carts
    WHERE user_name = 'huahua'
    GROUP BY item_id;

    SELECT * FROM SELECT item_id, SUM(quantity) as sum_quantity
    FROM carts
    WHERE user_name = 'huahua'
    GROUP BY item_id LEFT JOIN furnitures ON tempcarts.item_id = furnitures.id;


SELECT DISTINCT item_id, item, photo_url, from carts
WHERE user_name = 'yi'
ORDER BY item_id;

SELECT item_id, COUNT (*) FROM carts 
WHERE user_name = 'yi' 
GROUP BY item_id
ORDER BY item_id;

SELECT * FROM 
(SELECT DISTINCT item_id, item, photo_url from carts WHERE user_name = 'yi') as temp1
LEFT JOIN (SELECT item_id, COUNT (*) FROM carts  WHERE user_name = 'yi' GROUP BY item_id) as temp2
ON temp1.item_id = temp2.item_id
;

SELECT DISTINCT item_id, item, photo_url from carts


