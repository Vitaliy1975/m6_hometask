import sqlite3

def execute_query(num):
    with open(f'{num}.sql', 'r') as f:
        sql = f.read()

    with sqlite3.connect('database.db') as con:
        cur = con.cursor()
        cur.execute(sql)
        return cur.fetchall()


if __name__ == "__main__":
    for i in range(1,11):
        print(f"Executing file {i}.sql")
        print(execute_query(i))
