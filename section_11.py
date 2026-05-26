import psycopg2
import psycopg2.extras

hostname = 'localhost'
database = 'demo'
username = 'postgres'
pwd = '9742799438'
port_id = 5432
# cur = Nonw
conn = None
try:
    with psycopg2.connect(
        host = hostname,
        dbname = database,
        user = username,
        password = pwd,
        port = port_id
        ) as conn:

        with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:

            cur.execute('DROP TABLE IF EXISTS employee')

            create_script = '''
                CREATE TABLE IF NOT EXISTS employee(
                    id INT PRIMARY KEY,
                    name VARCHAR(50),
                    salary NUMERIC,
                    dept VARCHAR(30)
                )
            '''
            cur.execute(create_script)
            
            insert_script = '''
            INSERT INTO employee(id,name,salary,dept)
            VALUES(%s,%s,%s,%s)
            '''
            insert_values = [(1,'Vinay',75000,'SDE'),(2,'Balaji',80000,'HR'),(3,'Rakshit',78000,'VLSI'),(4,'Nitin',100000,'SDE3')]

            for record in insert_values:
                cur.execute(insert_script,record)
            
            delete_script = 'DELETE FROM employee WHERE name = %s'
            delete_record = ('Balaji',)
            cur.execute(delete_script,delete_record)

            update_script = 'UPDATE employee SET salary = salary + (salary*0.5)'
            cur.execute(update_script)

            cur.execute('SELECT * FROM employee')
            
            records = cur.fetchall()
            for record in records:
                print(record['name'],record['salary'])

            # conn.commit()
except Exception as e:
    print(e)

finally:
    if conn:
        conn.close()