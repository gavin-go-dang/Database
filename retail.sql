
--CREATE TABLE 
CREATE TABLE Items (
	item_id int PRIMARY KEY NOT NULL,
	name_product varchar(50) NOT NULL,
	price real NOT NULL,
	shop_id int NOT NULL,
	stocking_status boolean NOT NULL,
	unit varchar(20)
);

CREATE TABLE Shops(
	shop_id INT PRIMARY KEY NOT NULL,
	name_shop varchar(50) NOT NULL,
	address varchar(50) NOT NULL,
	phone varchar(15) NOT NULL,
	rate REAL NOT NULL	
);


CREATE TABLE Customers(
	cust_id INT NOT NULL PRIMARY KEY,
	cust_name varchar (50) NOT NULL,
	phone varchar(15),
	address varchar(50),
	birthday date,
	sex boolean --1- male/ 0-female
);

CREATE TABLE TransferService(
	id_transfer_company INT NOT NULL PRIMARY KEY,
	company_name varchar (50) NOT NULL,
	phone varchar(15) NOT NULL,
	address varchar(50) NOT NULL,
	rate REAL NOT NULL 
);

CREATE TABLE Orders(
	order_id int PRIMARY KEY NOT NULL,
	cust_id int NOT NULL,
	date_create date NOT NULL,
	discount REAL
);
CREATE TABLE  OrderDetail(
	order_id int NOT NULL,
	item_id int NOT NULL,
	quantity int NOT NULL,
	PRIMARY KEY (order_id, item_id)
); 


CREATE  TABLE Shipping(
	shipping_id int PRIMARY KEY NOT NULL,
	order_id int UNIQUE NOT NULL,
	estimate int, --Number OF DAY TO  receive
	shipper_name varchar(50) NOT NULL,
	id_transfer_company int NOT NULL
);

--ADD CONSTRAINT

--Orders
ALTER TABLE Orders 
	ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY(cust_id) REFERENCES Customers(cust_id);





--OrderDetail
ALTER TABLE OrderDetail
	ADD CONSTRAINT FK_OrderDetail_Orders FOREIGN KEY(order_id) REFERENCES Orders(order_id);

ALTER TABLE OrderDetail
	ADD CONSTRAINT FK_OrderDetail_Items FOREIGN KEY(item_id) REFERENCES Items(item_id);


--Items

ALTER TABLE Items
	ADD CONSTRAINT FK_Items_Shops FOREIGN KEY(shop_id) REFERENCES Shops(shop_id);


--Shipping
ALTER TABLE Shipping
	ADD CONSTRAINT FK_Shipping_TransferService FOREIGN KEY(id_transfer_company) REFERENCES TransferService(id_transfer_company);

ALTER TABLE Shipping
	ADD CONSTRAINT FK_Shipping_Orders FOREIGN KEY(order_id) REFERENCES Orders(order_id);

--INSERT DATA
--SHOP

INSERT INTO Shops VALUES (0, 'FoodFresh', 'HCM', '098132545', 4.5);
INSERT INTO Shops VALUES (1, 'ToyKing', 'DN', '098132535', 4.8);
INSERT INTO Shops VALUES (2, 'FashionStyle', 'HN', '098132525', 4.2);
INSERT INTO Shops VALUES (3, 'ElectroTech', 'HCM', '098132515', 4.9);
INSERT INTO Shops VALUES (4, 'BookZone', 'PY', '098132505', 4.7);
INSERT INTO Shops VALUES (5, 'SportsZone', 'HN', '098132495', 4.4);
INSERT INTO Shops VALUES (6, 'HomeDecor', 'HCM', '098132485', 4.6);
INSERT INTO Shops VALUES (7, 'BeautyGlow', 'DN', '098132475', 4.3);
INSERT INTO Shops VALUES (8, 'GadgetHub', 'KH', '098132465', 4.8);
INSERT INTO Shops VALUES (9, 'PetParadise', 'HCM', '098132455', 4.5);
INSERT INTO Shops VALUES (10, 'MusicMelody', 'CT', '098132445', 4.7);
INSERT INTO Shops VALUES (11, 'ArtisticGallery', 'HN', '098132435', 4.1);
INSERT INTO Shops VALUES (12, 'TechGeeks', 'HCM', '098132425', 4.9);
INSERT INTO Shops VALUES (13, 'JewelGlam', 'DN', '098132415', 4.6);
INSERT INTO Shops VALUES (14, 'KidsJoy', 'HN', '098132405', 4.3);
INSERT INTO Shops VALUES (15, 'FitnessZone', 'HCM', '098132395', 4.5);
INSERT INTO Shops VALUES (16, 'SweetTreats', 'DL', '098132385', 4.8);
INSERT INTO Shops VALUES (17, 'OutdoorGear', 'QT', '098132375', 4.2);
INSERT INTO Shops VALUES (18, 'HealthEssentials', 'HCM', '098132365', 4.7);
INSERT INTO Shops VALUES (19, 'GameZone', 'DN', '098132355', 4.4);
INSERT INTO Shops VALUES (20, 'TravelBuddy', 'HUE', '098132345', 4.6);
INSERT INTO Shops VALUES (21, 'Fashionista', 'HCM', '098132335', 4.3);
INSERT INTO Shops VALUES (22, 'HomeAppliances', 'DN', '098132325', 4.9);
INSERT INTO Shops VALUES (23, 'CosmeticHaven', 'HN', '098132315', 4.5);
INSERT INTO Shops VALUES (24, 'ToyLand', 'HCM', '098132305', 4.8);
INSERT INTO Shops VALUES (25, 'PetShoppe', 'DN', '098132295', 4.7);
INSERT INTO Shops VALUES (26, 'GourmetDelight', 'HN', '098132285', 4.2);
INSERT INTO Shops VALUES (27, 'GadgetZone', 'HCM', '098132275', 4.9);
INSERT INTO Shops VALUES (28, 'MusicParadise', 'DN', '098132265', 4.6);
INSERT INTO Shops VALUES (29, 'Bookworm', 'HN', '098132255', 4.4);
INSERT INTO Shops VALUES (30, 'SportingGoods', 'HCM', '098132245', 4.7);


--Customers
INSERT INTO customers VALUES (0, 'Nguyen Van A', '0943256525', 'HCM', '1-1-2019', TRUE);
INSERT INTO customers VALUES (1, 'Dang Thanh B', '0943756525', 'QNINH', '5-7-2019', TRUE);
INSERT INTO customers VALUES (2, 'Dang Thanh B', '0943756525', 'QNAM', '12-22-2019', FALSE);
INSERT INTO customers VALUES (3, 'Tran Tan C', '0943756525', 'BK', '1-14-2019', TRUE);
INSERT INTO customers VALUES (4, 'Nguyen Thi H', '0943756525', 'CT', '3-14-2019', FALSE);
INSERT INTO customers VALUES (5, 'Dang Thanh B', '0943756525', 'BD', '4-22-2019', TRUE);
INSERT INTO customers VALUES (6, 'Nguyen Van D', '0943256525', 'HCM', '2-5-2019', FALSE);
INSERT INTO customers VALUES (7, 'Tran Thi E', '0943756525', 'QNINH', '6-9-2019', TRUE);
INSERT INTO customers VALUES (8, 'Le Van F', '0943756525', 'QNAM', '11-18-2019', FALSE);
INSERT INTO customers VALUES (9, 'Pham Thi G', '0943756525', 'BK', '2-28-2019', TRUE);
INSERT INTO customers VALUES (10, 'Nguyen Van H', '0943756525', 'CT', '4-1-2019', FALSE);
INSERT INTO customers VALUES (11, 'Tran Thi I', '0943756525', 'BD', '5-10-2019', TRUE);
INSERT INTO customers VALUES (12, 'Nguyen Van J', '0943256525', 'HCM', '3-7-2019', FALSE);
INSERT INTO customers VALUES (13, 'Tran Thi K', '0943756525', 'QNINH', '7-12-2019', TRUE);
INSERT INTO customers VALUES (14, 'Le Van L', '0943756525', 'QNAM', '10-15-2019', FALSE);
INSERT INTO customers VALUES (15, 'Pham Thi M', '0943756525', 'BK', '4-23-2019', TRUE);
INSERT INTO customers VALUES (16, 'Nguyen Van N', '0943756525', 'CT', '5-29-2019', FALSE);
INSERT INTO customers VALUES (17, 'Tran Thi O', '0943756525', 'BD', '6-30-2019', TRUE);
INSERT INTO customers VALUES (18, 'Nguyen Van P', '0943256525', 'HCM', '4-18-2019', FALSE);
INSERT INTO customers VALUES (19, 'Tran Thi Q', '0943756525', 'QNINH', '8-21-2019', TRUE);
INSERT INTO customers VALUES (20, 'Le Van R', '0943756525', 'QNAM', '9-8-2019', FALSE);
INSERT INTO customers VALUES (21, 'Pham Thi S', '0943756525', 'BK', '5-6-2019', TRUE);
INSERT INTO customers VALUES (22, 'Nguyen Van T', '0943756525', 'CT', '6-15-2019', FALSE);
INSERT INTO customers VALUES (23, 'Tran Thi U', '0943756525', 'BD', '7-25-2019', TRUE);
INSERT INTO customers VALUES (24, 'Nguyen Van V', '0943256525', 'HCM', '5-12-2019', FALSE);
INSERT INTO customers VALUES (25, 'Tran Thi W', '0943756525', 'QNINH', '9-27-2019', TRUE);

--TransferService
INSERT INTO TransferService VALUES (0, 'ShoppeExpress', '0987452145', 'HN', 4.3);
INSERT INTO TransferService VALUES (1, 'NinjaVan', '0987452345', 'HCM', 4.8);
INSERT INTO TransferService VALUES (2, 'J&TExpress', '0987451145', 'DN', 3.2);



--Items
INSERT INTO Items VALUES (0, 'Chuoi Da Lat', 5000, 6, True, 'trai');
INSERT INTO Items VALUES (1, 'Tao USA', 10000, 12, True, 'trai');
INSERT INTO Items VALUES (3, 'Tao USA', 50000, 11, True, 'kg');
INSERT INTO Items VALUES (4, 'Tao USA', 70000, 13, False, 'kg');
INSERT INTO Items VALUES (5, 'Bong chuyen', 250000, 11, True, 'qua');
INSERT INTO Items VALUES (6, 'Bong da', 300000, 26, True, 'qua');
INSERT INTO Items VALUES (7, 'Gao huong lai', 15000, 11, True, 'kg');
INSERT INTO Items VALUES (8, 'Thit bo', 85000, 19, False, 'kg');
INSERT INTO Items VALUES (9, 'Thit heo', 35000, 16, True, 'kg');
INSERT INTO Items VALUES (10, 'Thit heo', 45000, 20, True, 'kg');
INSERT INTO Items VALUES (11, 'Ban go', 45000, 22, False, 'cai');
INSERT INTO Items VALUES (2, 'Cam Vinh', 8000, 8, True, 'qua');
INSERT INTO Items VALUES (12, 'Ban chai', 5000, 5, False, 'cai');
INSERT INTO Items VALUES (13, 'Ca rot', 2000, 10, True, 'kg');
INSERT INTO Items VALUES (14, 'Dua hau', 15000, 7, True, 'qua');
INSERT INTO Items VALUES (15, 'Mi chinh', 3000, 3, True, 'goi');
INSERT INTO Items VALUES (16, 'Nuoc mam', 10000, 2, False, 'chai');
INSERT INTO Items VALUES (17, 'Sua tuoi', 25000, 4, True, 'lon');
INSERT INTO Items VALUES (18, 'Sua chua', 5000, 6, True, 'lon');
INSERT INTO Items VALUES (19, 'Thit ga', 45000, 15, True, 'kg');
INSERT INTO Items VALUES (20, 'Tom hum', 80000, 18, False, 'kg');
INSERT INTO Items VALUES (21, 'Banh mi', 7000, 9, True, 'cai');
INSERT INTO Items VALUES (22, 'Ca basa', 35000, 14, True, 'kg');
INSERT INTO Items VALUES (23, 'Dau phong', 10000, 7, True, 'kg');
INSERT INTO Items VALUES (24, 'Suon heo', 65000, 17, False, 'kg');
INSERT INTO Items VALUES (25, 'Trung ga', 5000, 12, True, 'qua');
INSERT INTO Items VALUES (26, 'Tao USA', 15000, 8, True, 'trai');
INSERT INTO Items VALUES (27, 'Tao USA', 30000, 12, True, 'trai');
INSERT INTO Items VALUES (28, 'Tao USA', 60000, 15, True, 'kg');
INSERT INTO Items VALUES (29, 'Tao USA', 80000, 11, False, 'kg');
INSERT INTO Items VALUES (30, 'Bong chuyen', 200000, 9, True, 'qua');
INSERT INTO Items VALUES (31, 'Bong da', 250000, 22, True, 'qua');
INSERT INTO Items VALUES (32, 'Gao huong lai', 12000, 10, True, 'kg');
INSERT INTO Items VALUES (33, 'Thit bo', 75000, 16, False, 'kg');
INSERT INTO Items VALUES (34, 'Thit heo', 30000, 13, True, 'kg');
INSERT INTO Items VALUES (35, 'Thit heo', 40000, 17, True, 'kg');
INSERT INTO Items VALUES (36, 'Ban go', 40000, 19, False, 'cai');
INSERT INTO Items VALUES (37, 'Chuoi Da Lat', 4500, 7, True, 'trai');
INSERT INTO Items VALUES (38, 'Tao USA', 12000, 9, True, 'trai');
INSERT INTO Items VALUES (39, 'Tao USA', 55000, 16, True, 'kg');
INSERT INTO Items VALUES (40, 'Tao USA', 75000, 14, False, 'kg');

--Orders
INSERT INTO Orders VALUES (	0, 0, '12-6-2022', 0.5);
INSERT INTO Orders VALUES (	1, 1, '12-6-2022', 0.15);
INSERT INTO Orders VALUES (	2, 0, '12-6-2022', 0.1);
INSERT INTO Orders VALUES (	3, 2, '12-7-2022', 0.03);
INSERT INTO Orders VALUES (	4, 2, '12-7-2022', 0.5);
INSERT INTO Orders VALUES (	5, 1, '12-7-2022', 0.15);
INSERT INTO Orders VALUES (	6, 3, '12-7-2022', 0.1);
INSERT INTO Orders VALUES (	7, 4, '12-7-2022', 0.03);
INSERT INTO Orders VALUES (	8, 5, '12-8-2022', 0.5);
INSERT INTO Orders VALUES (	9, 4, '12-8-2022', 0.15);
INSERT INTO Orders VALUES (	10, 1, '12-8-2022', 0.1);
INSERT INTO Orders VALUES (	11, 8, '12-8-2022', 0.03);
INSERT INTO Orders VALUES (	12, 2, '12-8-2022', 0.5);
INSERT INTO Orders VALUES (	13, 9, '12-8-2022', 0.15);
INSERT INTO Orders VALUES (	14, 10, '12-8-2022', 0.1);
INSERT INTO Orders VALUES (	15, 11, '12-8-2022', 0.03);

INSERT INTO Orders VALUES (	16, 14, '12-9-2022', 0.03);
INSERT INTO Orders VALUES (	17, 15, '12-9-2022', 0.03);
INSERT INTO Orders VALUES (	18, 14, '12-9-2022', 0.03);
INSERT INTO Orders VALUES (	19, 18, '12-9-2022', 0.03);
INSERT INTO Orders VALUES (	20, 19, '12-9-2022', 0.03);
INSERT INTO Orders VALUES (	21, 4, '12-9-2022', 0.03);
INSERT INTO Orders VALUES (	22, 16, '12-9-2022', 0.03);
INSERT INTO Orders VALUES (	23, 22, '12-9-2022', 0.03);
INSERT INTO Orders VALUES (	24, 25, '12-9-2022', 0.03);


INSERT INTO Orders VALUES (	25, 20, '1-1-2023', 0.5);
INSERT INTO Orders VALUES (	26, 19, '2-1-2023', 0.0);
INSERT INTO Orders VALUES (	27, 20, '2-1-2023', 0.1);
INSERT INTO Orders VALUES (	28, 11, '2-1-2023', 0.02);
INSERT INTO Orders VALUES (	29, 15, '3-1-2023', 0.0);
INSERT INTO Orders VALUES (	30, 1, '3-1-2023', 0.01);
INSERT INTO Orders VALUES (	31, 3, '4-1-2023', 0.25);
INSERT INTO Orders VALUES (	32, 5, '4-1-2023', 0.11);



--shipping 
INSERT INTO Shipping VALUES (0, 0, 2, 'Nguyen Van T', 0);
INSERT INTO Shipping VALUES (1, 1, 3, 'Ho thanh R', 1);
INSERT INTO Shipping VALUES (2, 2, 1, 'Nguyen Van A', 2);
INSERT INTO Shipping VALUES (3, 4, 6, 'Nguyen Van B', 1);
INSERT INTO Shipping VALUES (4, 5, 4, 'Nguyen Van C', 0);

INSERT INTO Shipping VALUES (5, 6, 2, 'Nguyen Van D', 0);
INSERT INTO Shipping VALUES (6, 8, 3, 'Nguyen Tan H', 1);
INSERT INTO Shipping VALUES (7, 9, 1, 'Luong Van D', 2);
INSERT INTO Shipping VALUES (8, 10, 6, 'Truong Quoc D', 1);
INSERT INTO Shipping VALUES (9, 11, 4, 'Nguyen Van C', 0);


INSERT INTO Shipping VALUES (10, 12, 2, 'Nguyen Van T', 0);
INSERT INTO Shipping VALUES (11, 14, 3, 'Ho thanh S', 1);
INSERT INTO Shipping VALUES (12, 15, 1, 'Nguyen Van Y', 2);
INSERT INTO Shipping VALUES (13, 16, 6, 'Dang Van Z', 1);
INSERT INTO Shipping VALUES (14, 17, 4, 'Pham Van C', 0);

INSERT INTO Shipping VALUES (15, 18, 2, 'Luong Van T', 0);
INSERT INTO Shipping VALUES (16, 19, 3, 'Luu thanh R', 1);
INSERT INTO Shipping VALUES (17, 20, 1, 'Ha Van A', 2);
INSERT INTO Shipping VALUES (18, 21, 6, 'Ngo Van B', 1);
INSERT INTO Shipping VALUES (19, 22, 4, 'Nguyen Van C', 0);

--Order Detail


INSERT INTO OrderDetail VALUES (0 , 0 , 3);
INSERT INTO OrderDetail VALUES (0 , 1 , 1);
INSERT INTO OrderDetail VALUES (0 , 5 , 8);

INSERT INTO OrderDetail VALUES (1 , 2 , 3);
INSERT INTO OrderDetail VALUES (1 , 1 , 3);
INSERT INTO OrderDetail VALUES (1 , 5 , 6);


INSERT INTO OrderDetail VALUES (2 , 8 , 7);
INSERT INTO OrderDetail VALUES (2 , 6 , 1);
INSERT INTO OrderDetail VALUES (2 , 12, 1);
INSERT INTO OrderDetail VALUES (2 , 9 , 13);


INSERT INTO OrderDetail VALUES (3 , 1 , 1);
INSERT INTO OrderDetail VALUES (3 , 3 , 1);
INSERT INTO OrderDetail VALUES (3 , 5 , 1);
INSERT INTO OrderDetail VALUES (3 , 7 , 1);
INSERT INTO OrderDetail VALUES (3 , 9 , 1);

INSERT INTO OrderDetail VALUES (4 , 1 , 1);
INSERT INTO OrderDetail VALUES (4 , 3 , 1);
INSERT INTO OrderDetail VALUES (4 , 5 , 1);

INSERT INTO OrderDetail VALUES (5 , 7 , 1);
INSERT INTO OrderDetail VALUES (5 , 22 , 1);


--The customers has over 2 orders at 1 shop
EXPLAIN ANALYZE SELECT * 
FROM customers 
WHERE customers.cust_id IN (
    SELECT customers.cust_id
    FROM customers
    LEFT JOIN orders ON customers.cust_id = orders.cust_id
    INNER JOIN orderdetail ON orderdetail.order_id = orders.order_id
    JOIN items ON items.item_id = orderdetail.item_id
    JOIN shops ON items.shop_id = shops.shop_id
    GROUP BY customers.cust_id, shops.shop_id
    HAVING COUNT(orders.order_id) <= 2
);
--optimize

EXPLAIN SELECT * 
FROM customers
WHERE customers.cust_id NOT IN (
    SELECT customers.cust_id
    FROM customers
    LEFT JOIN (SELECT cust_id, order_id FROM orders) AS order_id ON customers.cust_id = order_id.cust_id
    JOIN (SELECT order_id, item_id FROM orderdetail) AS order_id_and_order_item ON  order_id_and_order_item.order_id = order_id.order_id
    JOIN (SELECT item_id, shop_id FROM items) AS item_id_and_shop_id ON item_id_and_shop_id.item_id =  order_id_and_order_item.item_id
    JOIN (SELECT shop_id FROM shops) AS shop_id ON item_id_and_shop_id.shop_id = shop_id.shop_id
    GROUP BY customers.cust_id, shop_id.shop_id
    HAVING COUNT(order_id.order_id) <= 2
);


--optimize2

EXPLAIN
    SELECT customers.*
    FROM customers
    LEFT JOIN (SELECT cust_id, order_id FROM orders) AS order_id ON customers.cust_id = order_id.cust_id
    JOIN (SELECT order_id, item_id FROM orderdetail) AS order_id_and_order_item ON  order_id_and_order_item.order_id = order_id.order_id
    JOIN (SELECT item_id, shop_id FROM items) AS item_id_and_shop_id ON item_id_and_shop_id.item_id =  order_id_and_order_item.item_id
    JOIN (SELECT shop_id FROM shops) AS shop_id ON item_id_and_shop_id.shop_id = shop_id.shop_id
    GROUP BY customers.cust_id, shop_id.shop_id
    HAVING COUNT(order_id.order_id) > 2;
   
   --
EXPLAIN ANALYZE
    SELECT customers.*
    FROM customers
    LEFT JOIN (SELECT cust_id, order_id FROM orders) AS order_id ON customers.cust_id = order_id.cust_id
    JOIN (SELECT order_id, item_id FROM orderdetail) AS order_id_and_order_item ON  order_id_and_order_item.order_id = order_id.order_id
    JOIN (SELECT item_id, shop_id FROM items) AS item_id_and_shop_id ON item_id_and_shop_id.item_id =  order_id_and_order_item.item_id
    JOIN (SELECT shop_id FROM shops) AS shop_id ON item_id_and_shop_id.shop_id = shop_id.shop_id
    GROUP BY customers.cust_id, shop_id.shop_id
    HAVING COUNT(order_id.order_id) <= 2;
   
   
--The orders has value over 100 000 and total cost for each order--
EXPLAIN ANALYZE SELECT orders.*,  sum(items.price*orderdetail.quantity)
FROM orders JOIN orderdetail ON orders.order_id = orderdetail.order_id 
	JOIN items ON items.item_id = orderdetail.item_id
GROUP BY orders.order_id
HAVING sum(items.price*orderdetail.quantity)>100000

--total cost each customer in December
EXPLAIN ANALYZE SELECT customers.cust_name,orders.date_create, sum(items.price*orderdetail.quantity) AS total
FROM customers JOIN orders ON orders.cust_id = customers.cust_id 
	JOIN orderdetail ON orders.order_id = orderdetail.order_id 
	JOIN items ON items.item_id = orderdetail.item_id
WHERE EXTRACT(MONTH FROM orders.date_create) = 12
GROUP BY customers.cust_id, orders.date_create


--INDEXING
CREATE INDEX index_customers_cust_id ON customers (cust_id);

CREATE INDEX index_orders_order_id ON orders (order_id);
CREATE INDEX index_orders_cust_id ON orders (cust_id);
CREATE INDEX index_orders_date_create ON orders (date_create);

CREATE INDEX index_orderdetail_order_id ON orderdetail (order_id);
CREATE INDEX index_orderdetail_order_item ON orderdetail (item_id);

CREATE INDEX index_item_item_id ON items (item_id);
CREATE INDEX index_item_shop_id ON items (shop_id);

CREATE INDEX index_shops_shop_id ON shops (shop_id);

--example 1
EXPLAIN ANALYZE
    SELECT customers.*
    FROM customers
    LEFT JOIN (SELECT cust_id, order_id FROM orders) AS order_id ON customers.cust_id = order_id.cust_id
    JOIN (SELECT order_id, item_id FROM orderdetail) AS order_id_and_order_item ON  order_id_and_order_item.order_id = order_id.order_id
    JOIN (SELECT item_id, shop_id FROM items) AS item_id_and_shop_id ON item_id_and_shop_id.item_id =  order_id_and_order_item.item_id
    JOIN (SELECT shop_id FROM shops) AS shop_id ON item_id_and_shop_id.shop_id = shop_id.shop_id
    GROUP BY customers.cust_id, shop_id.shop_id
    HAVING COUNT(order_id.order_id) > 2;
   --HashAggregate  (cost=8.57..8.82 rows=7 width=297) (actual time=0.314..0.334 rows=13 loops=1)
 
  --example 2

EXPLAIN ANALYZE SELECT orders.*,  sum(items.price*orderdetail.quantity)
FROM orders JOIN orderdetail ON orders.order_id = orderdetail.order_id 
	JOIN items ON items.item_id = orderdetail.item_id
GROUP BY orders.order_id
HAVING sum(items.price*orderdetail.quantity)>100000
   --HashAggregate  (cost=5.22..5.47 rows=7 width=24) (actual time=0.191..0.200 rows=5 loops=1)

--example 3

EXPLAIN ANALYZE SELECT customers.cust_name,orders.date_create, sum(items.price*orderdetail.quantity) AS total
FROM customers JOIN orders ON orders.cust_id = customers.cust_id 
	JOIN orderdetail ON orders.order_id = orderdetail.order_id 
	JOIN items ON items.item_id = orderdetail.item_id
WHERE EXTRACT(MONTH FROM orders.date_create) = 12
GROUP BY customers.cust_id, orders.date_create

--GroupAggregate  (cost=4.95..4.98 rows=1 width=134) (actual time=0.415..0.427 rows=4 loops=1)
   
EXPLAIN select * from customers
where cust_id >2





