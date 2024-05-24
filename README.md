# SQL_excercise
## Building a MySQL database from scratch and answering some of the given question




### Tasks:

Create the sales, clients, products, categories, and manufacturers tables with appropriate columns. Set the primary keys to AUTO INCREMENT if you wish.
Insert sample data into all five tables (3 categories, 3 manufacturers, 10 products, 4 clients, 30 sales) - you may randomize the prices/amounts, names, locations. dates should all be within 2023. Please make sure to avoid rerunning INSERT statements so your rows won't duplicate.




### Retrieve the following information:

List all sales along with the client's name, email, and location.
List sales made after a specific date - march 2023.
Calculate the total amount spent by each client (group by clients if they have multiple purchases under “sales” table).
Calculate the total number of products for each category
List sales sorted by sale date in descending order.
List products along with their category and manufacturer information.
List clients who have purchased products from a specific category (you may use one category only).
List the total sales amount for each category (so this means group the sales by category).
List the total sales amount for each manufacturer (so this means group the sales by manufacturer).




### Guide to make your own MySQL Database


Tables:
sales:

Columns:

sale_id (int, primary key): unique identifier for each sale
client_id (int): identifier for the client who made the purchase (foreign key to clients table)
sale_date (date): date when the sale was made
product_id (int): identifier for the product sold (foreign key to products table)
quantity_sold (int): quantity of the product sold
total_amount (decimal): total amount of the sale


Tables:
clients:

Columns:

client_id (int, primary key): unique identifier for each client
name (varchar): name of the client
email (varchar): email address of the client
location (varchar): location of the client

Tables:
products:


Columns:

product_id (int, primary key): unique identifier for each product
name (varchar): name of the product
price (decimal): price of the product
category_id (int): identifier for the category the product belongs to (foreign key to categories table)
manufacturer_id (int): an identifier for the manufacturer of the product (foreign key to manufacturers table)


Tables:
categories:


Columns:

category_id (int, primary key): unique identifier for each category
name (varchar): name of the category


Tables:
manufacturers:


Columns:

manufacturer_id (int, primary key): unique identifier for each manufacturer
name (varchar): name of the manufacturer






