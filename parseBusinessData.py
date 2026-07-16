import csv
import psycopg2

conn = psycopg2.connect(
    dbname="hw5db",
    user="sydnee",
    password="password", 
    host="localhost"
)
cur = conn.cursor()

with open('mySalesData.csv', mode='r') as file:
    fieldnames = ['pName', 'discount', 'month', 'price']  # set fieldnames
    reader = csv.DictReader(file, fieldnames=fieldnames)
    for row in reader:
        cur.execute( #create a new row in db for each csv row
            "INSERT INTO MySales (pName, discount, month, price) VALUES (%s, %s, %s, %s)",
            (row['pName'], row['discount'], row['month'], row['price'])
        )

conn.commit() 
cur.close()
conn.close()
print("Done loading data.")
