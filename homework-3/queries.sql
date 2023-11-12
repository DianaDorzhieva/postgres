-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
SELECT  customers.company_name,CONCAT(first_name, ' ', last_name) as fullname
from  customers
JOIN orders USING (customer_id)
JOIN employees USING (employee_id)
WHERE customers.city = 'London' and employees.city = 'London'
and orders.ship_via=2

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
SELECT product_name, units_in_stock, suppliers.contact_name, suppliers.phone
from products
JOIN categories USING (category_id)
JOIN suppliers  USING (supplier_id)
WHERE discontinued = 0 and units_in_stock < 25 and
(category_name IN ('Condiments','Dairy Products'))
ORDER BY units_in_stock

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
SELECT company_name
from customers
WHERE customer_id in
(SELECT customer_id from customers
EXCEPT
SELECT customer_id from orders)

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
SELECT  DISTINCT product_name
from products
JOIN order_details USING (product_id)
WHERE product_id in
(SELECT product_id
from order_details
WHERE quantity = 10)
ORDER BY product_name