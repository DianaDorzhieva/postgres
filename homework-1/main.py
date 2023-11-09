"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv

conn = psycopg2.connect(
    host='localhost',
    database='north',
    user='postgres',
    password='12345'
)
cur = conn.cursor()
"""Добавляем данные в таблицу customers"""
file_way1 = "../src/customers_data.csv"
with open(file_way1) as file:
    words = csv.DictReader(file)
    for word in words:
        cur.execute('INSERT INTO customers VALUES (%s,%s,%s)',
                    (word["customer_id"], word["company_name"], word["contact_name"]))

"""Добавляем данные в таблицу employees"""
file_way2 = "../src/employees_data.csv"
with open(file_way2) as file:
    words = csv.DictReader(file)
    for word in words:
        cur.execute('INSERT INTO employees VALUES (%s,%s,%s,%s,%s,%s)',
                    (word['employee_id'], word['first_name'], word['last_name'],
                     word['title'], word['birth_date'], word['notes']))

"""Добавляем данные в таблицу  orders"""
file_way3 = "../src/orders_data.csv"
with open(file_way3) as file:
    words = csv.DictReader(file)
    for word in words:
        cur.execute('INSERT INTO orders VALUES (%s,%s,%s,%s,%s)',
                    (word["order_id"], word["customer_id"], word["employee_id"],
                     word["order_date"], word["ship_city"]))

conn.commit()
cur.close()
conn.close()
