CREATE TABLE USERS(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date NUMERIC NOT NULL,
    time NUMERIC NOT NULL,
    name TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    user_type TEXT NOT NULL
);

CREATE TABLE CATEGORIES(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    category_order INTEGER NULL NULL UNIQUE
);

CREATE TABLE PRODUCTS(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    image_url TEXT NOT NULL,
    price REAL NOT NULL,
    other_details TEXT,
    category_id INTEGER NOT NULL,
    displayed INTEGER NOT NULL,
    FOREIGN KEY(category_id) REFERENCES CATEGORIES(id)
);

CREATE TABLE CARTS(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    status TEXT NOT NULL,
    date NUMERIC NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES USERS(id)
);

CREATE TABLE CARTPRODUCTS(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cart_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY(cart_id) REFERENCES CARTS(id),
    FOREIGN KEY(product_id) REFERENCES PRODUCTS(id)
);