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