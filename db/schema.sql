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
    price 

)

CREATE TABLE carts(
    id SERIAL PRIMARY KEY,
    item TEXT,
    quantity INTEGER
);

 ALTER TABLE <数据表名> ADD CONSTRAINT <检查约束名> CHECK(<检查约束>)