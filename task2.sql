CREATE TABLE customers(
		cust_id SERIAL PRIMARY KEY,
		cust_name VARCHAR(50) NOT NULL
);

INSERT INTO customers (cust_name)
VALUES
    ('Raju'), ('Sham'), ('Paul'), ('Alex');

CREATE TABLE orders(
		ord_id SERIAL PRIMARY KEY,
		ord_dat DATE NOT NULL,
		cust_id INT NOT NULL,
		FOREIGN KEY (cust_id) REFERENCES
		customers(cust_id)
);

INSERT INTO orders (ord_dat, cust_id)
VALUES
    ('2024-01-01', 1),  -- Raju first order
    ('2024-02-01', 2),  -- Sham first order
    ('2024-03-01', 3),  -- Paul first order
    ('2024-04-04', 2);  -- Sham second order

CREATE TABLE products(
		p_id SERIAL PRIMARY KEY,
		p_name VARCHAR(100) NOT NULL,
		price NUMERIC NOT NULL
);

INSERT INTO products (p_name, price)
VALUES
    ('Laptop', 55000.00),
    ('Mouse', 500),
    ('Keyboard', 800.00),
    ('Cable', 250.00)
;

CREATE TABLE ord_items(
		item_id SERIAL PRIMARY KEY,
		ord_id INT NOT NULL,
		p_id INT NOT NULL,
		quantity INT NOT NULL,
		FOREIGN KEY(ord_id) REFERENCES orders(ord_id),
		FOREIGN KEY(p_id) REFERENCES products(p_id)
);

INSERT INTO ord_items (ord_id, p_id, quantity)
VALUES
    (1, 1, 1),  -- Raju ordered 1 Laptop
    (1, 4, 2),  -- Raju ordered 2 Cables
    (2, 1, 1),  -- Sham ordered 1 Laptop
    (3, 2, 1),  -- Paul ordered 1 Mouse
    (3, 4, 5),  -- Paul ordered 5 Cables
    (4, 3, 1);  -- Sham ordered 1 Keyboard

SELECT  c.cust_name,
		o.ord_id,
		o.ord_dat,
		p.p_name,
		oi.quantity,
		p.price,
		(oi.quantity*p.price) AS total_price
FROM ord_items oi
JOIN 
	products p ON oi.p_id=p.p_id
JOIN 
	orders o ON oi.ord_id=o.ord_id
JOIN 
	customers c ON o.cust_id=c.cust_id;