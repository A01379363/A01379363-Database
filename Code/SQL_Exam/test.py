import random

password = "@Bril152000"
book_words = "Crazy Innocent Reapers Chubby Bold Gargoyles Fleshy Live Sirens Jolly Cute Zombies Elegant Brunette Ghosts Obnoxious Wild Demons Teeny Ancient Angels Witty Blonde Mummies".split()
print(book_words[::3])
print(book_words[1::3])
print(book_words[2::3])
randfloat = random.uniform(.99, 99.99)
print(randfloat)
print(round(randfloat, 2))

d = """INSERT INTO libros_tags(id_libro, id_tag) values({i}, {random.randint(1,10)});
INSERT INTO libros_autores(id_libro, id_autor) values({i}, {random.randint(1,10)});"""
