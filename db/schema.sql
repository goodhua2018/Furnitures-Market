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