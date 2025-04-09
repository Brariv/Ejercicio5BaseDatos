CREATE TYPE ROL_TYPE AS ENUM('Buyer', 'Seller');
CREATE TYPE SALE_STATE AS ENUM('Pending', 'Payed');

CREATE TABLE cart(
    id SERIAL PRIMARY KEY,
    total_price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE wishlists(
    id SERIAL PRIMARY KEY,
    product_id VARCHAR(255)
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_with_salt VARCHAR(255) NOT NULL,
    wishlist_id SERIAL REFERENCES wishlists(id) ON DELETE CASCADE,
    cart_id SERIAL REFERENCES cart(id) ON DELETE CASCADE,
    role ROL_TYPE NOT NULL DEFAULT 'Buyer'
);

CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    stock INT CHECK(stock >= 0),
    description TEXT,
    seller_id SERIAL REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE product_cart(
    id SERIAL PRIMARY KEY,
    product_id SERIAL REFERENCES products(id) ON DELETE CASCADE NOT NULL,
    cart_id SERIAL REFERENCES cart(id) ON DELETE CASCADE NOT NULL,
    quantity INT CHECK(quantity > 0)
);

CREATE TABLE sale(
    id SERIAL PRIMARY KEY,
    cart_id SERIAL REFERENCES cart(id) ON DELETE CASCADE NOT NULL,
    sale_state SALE_STATE NOT NULL DEFAULT 'Pending',
    total_price NUMERIC(10, 2) NOT NULL
);