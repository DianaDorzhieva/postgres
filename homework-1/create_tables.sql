-- SQL-команды для создания таблиц
CREATE TABLE employees
(
 employee_id int PRIMARY KEY,
 first_name varchar(100) NOT NULL,
 last_name varchar(100) NOT NULL,
 title varchar(300) NOT NULL,
 birth_date varchar(300) NOT NULL,
 notes text
);


CREATE TABLE customers
(
  customer_id text PRIMARY KEY,
  company_name text NOT NULL,
  contact_name varchar(300) NOT NULL
);

CREATE TABLE orders
(
  order_id int PRIMARY KEY,
  custom_id text REFERENCES customers(customer_id) NOT NULL,
  employ_id int REFERENCES employees(employee_id) NOT NULL,
  order_date text,
  ship_city text
)


SELECT * from orders

