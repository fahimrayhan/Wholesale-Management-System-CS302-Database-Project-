CREATE TABLE product
(
  product_id INT NOT NULL,
  product_name VARCHAR(256) NOT NULL,
  category VARCHAR(256) NOT NULL,
  list_price FLOAT NOT NULL,
  product_description VARCHAR(256) NOT NULL,
  unit_price FLOAT NOT NULL,
  Product_Quantity INT NOT NULL,
  Stock_Status VARCHAR(256) NOT NULL,
  PRIMARY KEY (product_id),
  UNIQUE (product_name)
);

CREATE TABLE delivery
(
  delv_id INT NOT NULL,
  delv_by VARCHAR(256) NOT NULL,
  delv_time time NOT NULL,
  delv_status VARCHAR(256) NOT NULL,
  PRIMARY KEY (delv_id)
);

CREATE TABLE sales_report
(
  net_sales FLOAT NOT NULL,
  month DATE NOT NULL,
  sale_amount FLOAT NOT NULL,
  PRIMARY KEY (month, sale_amount)
);

CREATE TABLE customer
(
  customer_id INT NOT NULL,
  name VARCHAR(256) NOT NULL,
  gender CHAR(1) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE product_delivery
(
  product_id INT NOT NULL,
  delv_id INT NOT NULL,
  PRIMARY KEY (product_id, delv_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (delv_id) REFERENCES delivery(delv_id)
);

CREATE TABLE customer_customer_Email
(
  customer_Email VARCHAR(256) NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (customer_Email, customer_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE customer_contact_num
(
  contact_num VARCHAR(256) NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (contact_num, customer_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE orders
(
  order_id INT NOT NULL,
  order_date DATE NOT NULL,
  quantity INT NOT NULL,
  payment_status boolean NOT NULL,
  delv_id INT NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (order_id, delv_id),
  FOREIGN KEY (delv_id) REFERENCES delivery(delv_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE payment
(
  payment_id INT NOT NULL,
  amount FLOAT NOT NULL,
  paid_by VARCHAR(256) NOT NULL,
  payment_date DATE NOT NULL,
  transaction_id INT NOT NULL,
  month DATE NOT NULL,
  sale_amount FLOAT NOT NULL,
  customer_id INT NOT NULL,
  order_id INT NOT NULL,
  delv_id INT NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (month, sale_amount) REFERENCES sales_report(month, sale_amount),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (order_id, delv_id) REFERENCES orders(order_id, delv_id)
);

CREATE TABLE product_order
(
  product_id INT NOT NULL,
  order_id INT NOT NULL,
  delv_id INT NOT NULL,
  PRIMARY KEY (product_id, order_id, delv_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (order_id, delv_id) REFERENCES orders(order_id, delv_id)
);