-- CREATE CATEGORY TABLE
CREATE TABLE category (
  category_id INT PRIMARY KEY,
  category_name TEXT
);

INSERT INTO category VALUES
  (1, 'Tim Sum'),
  (2, 'Steamed bun'),
  (3, 'Meat');

-- CREATE MENU TABLE
CREATE TABLE menu (
  menu_id INT PRIMARY KEY,
  menu_name TEXT,
  price REAL,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);

INSERT INTO menu VALUES
(1, 'Shrimp Hahao', 80, 1),
(2, 'Shrimp Shumai', 60, 1),
(3, 'Cream Bun', 40, 2),
(4, 'Pork Bun', 40, 2),
(5, 'Red Pork Bun', 40, 2),
(6, 'Paking duck', 450, 3),
(7, 'Crispy Pork', 280, 3);

-- CREATE BRANCH TABLE
CREATE TABLE branches(
  branch_id INT PRIMARY KEY,
  branch_name TEXT
);

INSERT INTO branches VALUES
  (1, 'Bangna'),
  (2, 'Dusit');

-- CREATE EMPLOYEE TABLE
CREATE TABLE employee(
  employee_id INT PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
);

INSERT INTO employee VALUES
(1, 'Jirawan', 'Sasi'),
(2, 'Meeboon', 'Seethong'),
(3, 'Mituna', 'Meena'),
(4, 'Cember', 'Hamber');

-- CREATE PAYMENT_METHOD TABLE
CREATE TABLE payment_method(
  payment_method_id INT PRIMARY KEY,
  payment_method_name TEXT
);

INSERT INTO payment_method VALUES
  (1, 'Cash'),
  (2, 'Credit Card'),
  (3, 'Transfer');

-- CREATE CUSTOMER TABLE
CREATE TABLE customer(
  customer_id INT PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  address TEXT,
  phone TEXT
);

INSERT INTO customer VALUES
(1, 'Pakorn', 'Kittitham', 'Bangna', '081-223-1393'),
(2, 'Hatainuch', 'Jaikra', 'Bangna', '088-335-1023'),
(3, 'Chompoonuch', 'Meesook', 'Bang Sue', '086-334-1199'),
(4, 'Witoon', 'Wanchai', 'Dusit', '096-829-2348'),
(5, 'Wasan', 'Charoenpanich', 'Bang Saen', '082-544-0728');

-- CREATE ORDER TABLE
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date TEXT,
  branch_id INT,
  customer_id INT,
  employee_id INT,
  payment_method_id INT,
  FOREIGN KEY (branch_id) REFERENCES branches(branch_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id)
);

INSERT INTO orders VALUES
(1, '2022-08-01', 1, 1, 1, 1),
(2, '2022-08-01', 1, 2, 2, 3),
(3, '2022-08-01', 2, 3, 3, 2),
(4, '2022-08-01', 2, 4, 4, 1),
(5, '2022-08-02', 1, 5, 2, 3),
(6, '2022-08-02', 2, 3, 4, 2),
(7, '2022-08-02', 2, 4, 4, 1),
(8, '2022-08-02', 1, 1, 1, 1),
(9, '2022-08-03', 1, 2, 1, 3),
(10,'2022-08-03', 2, 4, 3, 1);

-- CREATE ORDER LINE TABLE
CREATE TABLE order_line (
  order_line_id INT PRIMARY KEY,
  qty INT,
  order_id INT,
  menu_id INT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
);

INSERT INTO order_line VALUES
(1, 2, 1, 1),
(2, 3, 1, 3),
(3, 2, 2, 2),
(4, 2, 2, 4),
(5, 2, 3, 5),
(6, 1, 3, 6),
(7, 1, 3, 1),
(8, 1, 4, 7),
(9, 3, 4, 2),
(10,1, 5, 4),
(11,2, 5, 2),
(12,1, 5, 6),
(13,1, 6, 7),
(14,2, 6, 3),
(15,2, 7, 1),
(16,3, 7, 4),
(17,1, 8, 3),
(18,3, 8, 1),
(19,1, 9, 6),
(20,1,10, 7);

-- GET REPORT
.mode table
.header on 

-- Menu
WITH sub AS (SELECT mn.menu_name, mn.price, ol.qty, mn.price * ol.qty AS 'total'
FROM order_line ol
JOIN menu mn ON mn.menu_id = ol.menu_id)

SELECT menu_name, sum(qty) t_qty, sum(total) amt
FROM sub
GROUP BY menu_name
ORDER BY sum(total) DESC;

-- Category
SELECT ct.category_name, sum(mn.price * ol.qty) AS 'amt'
FROM order_line ol
JOIN menu mn     ON mn.menu_id = ol.menu_id
JOIN category ct ON ct.category_id = mn.category_id
GROUP BY 1
ORDER BY 2 DESC;

-- Order_date
SELECT od.order_date, sum(mn.price * ol.qty) AS 'amt'
FROM order_line ol
JOIN menu mn   ON mn.menu_id = ol.menu_id
JOIN orders od ON od.order_id = ol.order_id
GROUP BY od.order_date;

-- Customer
SELECT 
  cm.first_name || ' ' || cm.last_name AS customer_name, 
  oa.amt
FROM (SELECT  od.customer_id, 
              sum(mn.price * ol.qty) AS 'amt'
      FROM order_line ol
      JOIN menu mn     ON mn.menu_id = ol.menu_id
      JOIN orders od   ON od.order_id = ol.order_id
      GROUP BY od.customer_id) AS oa
JOIN customer cm ON  cm.customer_id = oa.customer_id
ORDER BY 2 DESC;
  
-- Branch
SELECT 
  bh.branch_name, 
  oa.amt
FROM (SELECT  od.branch_id, 
              sum(mn.price * ol.qty) AS 'amt'
      FROM order_line ol
      JOIN menu mn     ON mn.menu_id = ol.menu_id
      JOIN orders od   ON od.order_id = ol.order_id
      GROUP BY od.branch_id) AS oa
JOIN branches bh ON  bh.branch_id = oa.branch_id
ORDER BY 2 DESC;

-- Payment Method
SELECT  pm.payment_method_name AS Payment_Method, 
        count(od.order_id) AS Times
FROM orders od 
JOIN payment_method pm 
  ON pm.payment_method_id = od.payment_method_id
GROUP BY pm.payment_method_name
ORDER BY count(od.order_id) DESC;

-- Employee
SELECT 
  em.first_name || ' ' || last_name AS employee_name, 
  oa.amt,
  ROUND(oa.amt / (SELECT sum(mn.price * ol.qty) 
            FROM order_line ol
            JOIN menu mn ON mn.menu_id = ol.menu_id)*100, 2)||' %' sales_prop
  
FROM (SELECT  od.employee_id, 
              sum(mn.price * ol.qty) AS 'amt'
      FROM order_line ol
      JOIN menu mn     ON mn.menu_id = ol.menu_id
      JOIN orders od   ON od.order_id = ol.order_id
      GROUP BY od.employee_id) AS oa
JOIN employee em ON  em.employee_id = oa.employee_id
GROUP BY 1
ORDER BY 3 DESC;
