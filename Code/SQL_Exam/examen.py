import mysql.connector
import random
import names

tags = ['"action"', '"mystery"', '"fantasy"', '"fiction"', '"horror"',
        '"romance"', '"sci-fi"', '"thriller"', '"biography"', '"history"']

book_words = "Crazy Innocent Reapers Chubby Bold Gargoyles Fleshy Live Sirens Jolly Cute Zombies Elegant Brunette Ghosts Obnoxious Wild Demons Teeny Ancient Angels Witty Blonde Mummies".split()


def date():
    month = random.randint(1, 12)
    if month == 2:
        day = random.randint(1, 29)
    elif month in [1, 3, 5, 7, 8, 10, 12]:
        day = random.randint(1, 31)
    else:
        day = random.randint(1, 30)

    date = f'"2020-{month}-{day}"'
    return date


def first_last():
    return f'"{names.get_first_name()}"', f'"{names.get_last_name()}"'


def book_title():
    return f'"{random.choice(book_words[::3])} {random.choice(book_words[1::3])} {random.choice(book_words[2::3])}"'


try:
    cnx = mysql.connector.connect(
        user='root', password='@Bril152000', host='127.0.0.1', database='examen')
    cursor = cnx.cursor()

    for tag in tags:
        query = (f"INSERT INTO tags(tag) values({tag});")
        cursor.execute(query)

    for i in range(10):
        first, last = first_last()
        query = (
            f"INSERT INTO autores(nombre, apellido) values({first}, {last});")
        cursor.execute(query)

    for i in range(1, 101):
        query = (
            f"""INSERT INTO libros(titulo, fecha_publicacion, precio) values({book_title()}, {date()}, {round(random.uniform(.99, 99.99), 2)});
                INSERT INTO libros_tags(id_libro, id_tag) values({i}, {random.randint(1,10)});
                INSERT INTO libros_autores(id_libro, id_autor) values({i}, {random.randint(1,10)});""")
        for _ in cursor.execute(query, multi=True):
            continue


    cnx.commit()
except mysql.connector.Error as err:

    if err.errno == mysql.connector.errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == mysql.connector.errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)

finally:
    cnx.close()
