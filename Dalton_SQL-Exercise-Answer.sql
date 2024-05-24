CREATE DATABASE IF NOT EXISTS exer01sql;




    CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    client_id INT,
    sale_date DATE,
    product_id INT,
    quantity_sold INT,
    total_amount DECIMAL(10, 2),   
);





CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255), 
    price DECIMAL(10, 2), 
    category_id INT,
    manufacturer_id INT,
   
    FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers(manufacturer_id)
);



CREATE TABLE categories(
category_id INT PRIMARY KEY,
    name VARCHAR (255)
);



CREATE TABLE Manufacturers (
manufacturer_id INT PRIMARY KEY,
  name VARCHAR (255)
);





##SINCE I CANNOT ADD A FOREIGN KEY without the creating the PRIMARY KEY of other tables first  i need to alter after creating the other table

ALTER TABLE Sales
ADD CONSTRAINT fk_client
FOREIGN KEY (client_id)
REFERENCES clients(client_id);


ALTER TABLE sales
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES products(product_id)


ALTER TABLE Products
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id)
REFERENCES Categories(category_id);


ALTER TABLE Products
ADD CONSTRAINT fk_manufacturer
FOREIGN KEY (manufacturer_id)
REFERENCES Manufacturers(manufacturer_id);



ALTER TABLE categories MODIFY COLUMN category_id INT AUTO_INCREMENT;
ALTER TABLE clients MODIFY COLUMN client_id INT AUTO_INCREMENT;
ALTER TABLE manufacturers MODIFY COLUMN manufacturer_id INT AUTO_INCREMENT;
ALTER TABLE manufacturers MODIFY COLUMN manufacturer_id INT AUTO_INCREMENT;
ALTER TABLE sales MODIFY COLUMN sale_id INT AUTO_INCREMENT;



Tasks:




INSERT INTO categories (name)
VALUES 
    ('Top'),
    ('Bottom'),
    ('Accessories');



INSERT INTO clients (name, email, location)
VALUES
('John Doe', 'JD946@gmail.com', 'Bacolod'),
('Kim Chui', 'KC974@gmail.com', 'Cavite'),
('Vice Ganda', 'VG849@gmail.com', 'Leyte'),
('Ava Lee', 'AL499@gmail.com', 'Cebu');



INSERT INTO manufacturers (name)
VALUES 
("PYM particle"),
("Stark Industries"),
("Square Bucks");



INSERT INTO products (name, price, category_id, manufacturer_id)
VALUES
    ('Spider-Man Hoodie', 19.99, 1, 1),
    ('Avengers Sweatpants', 29.99, 2, 2),
    ('Iron Man Sunglasses', 39.99, 3, 3),
    ('Black Widow Tank', 14.99, 1, 2),
    ('Thor Socks', 24.99, 3, 3),
    ('Hawkeye Bow and Arrow Set', 34.99, 3, 3),
    ('Captain America Belt Buckle', 49.99, 3, 2),
    ('Hulk Baseball Cap', 19.99, 1, 2),
    ('Hawkeye Beanie', 9.99, 1, 1),
    ('Thanos Shorts', 99.99, 2, 1);





INSERT INTO sales (client_id, sale_date, product_id, quantity_sold, total_amount)
VALUES
    (1, '2023-03-10', 11, 2, 39.98),
    (2, '2023-05-18', 12, 1, 29.99),
    (3, '2023-07-07', 13, 3, 119.97),
    (4, '2023-08-22', 14, 2, 29.98),
    (1, '2023-09-05', 15, 1, 24.99),
    (2, '2023-10-11', 16, 2, 69.98),
    (3, '2023-11-19', 17, 1, 49.99),
    (4, '2023-12-04', 18, 3, 59.97),
    (1, '2023-01-15', 19, 2, 19.98),
    (2, '2023-02-28', 20, 1, 99.99),
    (3, '2023-04-08', 11, 1, 19.99),
    (4, '2023-06-13', 12, 2, 59.98),
    (1, '2023-07-25', 13, 1, 39.99),
    (2, '2023-09-03', 14, 3, 44.97),
    (3, '2023-10-17', 15, 2, 49.98),
    (4, '2023-11-30', 16, 1, 34.99),
    (1, '2023-02-09', 17, 3, 149.97),
    (2, '2023-03-20', 18, 1, 19.99),
    (3, '2023-04-28', 19, 2, 19.98),
    (4, '2023-06-05', 20, 1, 99.99),
    (1, '2023-07-16', 11, 3, 59.97),
    (2, '2023-08-29', 12, 1, 29.99),
    (3, '2023-10-07', 13, 2, 79.98),
    (4, '2023-11-21', 14, 1, 14.99),
    (1, '2023-12-29', 15, 3, 74.97),
    (2, '2023-02-12', 16, 1, 34.99),
    (3, '2023-03-26', 17, 2, 99.98),
    (4, '2023-05-03', 18, 1, 19.99),
    (1, '2023-06-15', 19, 3, 29.97),
    (2, '2023-07-28', 20, 2, 199.98);




 /* */List all sales along with the client's name, email, and location.

	SELECT
	c.name AS Client_Name, 
	c.email AS Client_Email,
	c.location AS Client_Location ,
	s.sale_id AS Sales_ID,
	s.sale_date AS Sales_Date,
	s.product_id AS Sales_Product_Id,
	s.quantity_sold AS Quantity_Sold,
	s.total_amount As Total_Amount


	FROM sales as s
	LEFT JOIN clients as c USING(client_id);



 /* */List sales made after a specific date - march 2023.

	SELECT
	c.name AS Client_Name, 
	c.email AS Client_Email,
	c.location AS Client_Location ,
	s.sale_id AS Sales_ID,
	s.sale_date AS Sales_Date,
	s.product_id AS Sales_Product_Id,
	s.quantity_sold AS Quantity_Sold,
	s.total_amount As Total_Amount


	FROM sales as s
	LEFT JOIN clients as c USING(client_id)
	WHERE MONTH(sale_date) = 3;



 /* */Calculate the total amount spent by each client (group by clients if they have multiple purchases under “sales” table).	
	SELECT c.client_id, 
	c.name AS Client_Name, 
	SUM(s.total_amount) AS Total_spent
	FROM clients AS c
	LEFT JOIN sales AS s USING(client_id)
	GROUP BY client_id

/* */ Calculate the total number of products for each category
	SELECT  COUNT(*) AS total_product , c.name AS category_name
	FROM categories as c
	LEFT JOIN products as p USING (category_id)
	GROUP BY category_id;


/* */
List sales sorted by sale date in descending order.


SELECT *
FROM sales
ORDER BY sale_date DESC;


/* */
List products along with their category and manufacturer information.


SELECT p.product_id AS product_id,
		p.name AS product_name,
        P.category_id AS product_category,
        P.manufacturer_id AS product_manufacturer,
        c.name AS category_name,
        m.name AS manufacturer_name
FROM products AS p
LEFT JOIN categories AS c USING (category_id)
LEFT JOIN manufacturers AS m USING (manufacturer_id)
ORDER BY product_id;



/* */
List clients who have purchased products from a specific category (you may use one category only).

SELECT  c2.name AS Client_Name,
		p.name AS product_name,
        c1.name AS category
FROM sales AS s
LEFT JOIN products AS p USING (product_id)
LEFT JOIN categories AS c1 USING (category_id)
LEFT JOIN clients AS c2 USING (client_id)
WHERE c1.category_id = 2
GROUP BY c2.name
ORDER BY p.product_id;



/* */
List the total sales amount for each category (so this means group the sales by category).

SELECT c.name AS Category_name , 
	SUM(s.total_amount) AS total_amount
FROM sales AS s
INNER JOIN products AS p USING (product_id)
INNER JOIN categories AS c USING (category_id)
GROUP BY category_id;



/* */
List the total sales amount for each manufacturer (so this means group the sales by manufacturer).


SELECT  m.name manufacturer_name , 
	SUM(s.total_amount) AS total_amount
FROM sales AS s
INNER JOIN products AS p USING (product_id)
INNER JOIN manufacturers AS m USING (manufacturer_id)
GROUP BY manufacturer_id;



