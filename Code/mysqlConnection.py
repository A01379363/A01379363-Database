import mysql.connector

try:
    cnx = mysql.connector.connect(user='root', password='@Bril152000', host='127.0.0.1', database='iot')
    cursor = cnx.cursor()

    #query_data = (7, 'Hall')
    #query = (f"INSERT INTO rooms(room_id, name) values(%s, %s);")
    
    #cursor.execute(query, query_data)


    #for light_id in range(7, 18):
    #  query_data = (light_id, False, 0)
    #  query = (f"INSERT INTO lights(light_id, turned_on, intensity) values(%s, %s, %s);")
    #  cursor.execute(query, query_data)

    query_data = {'light_id': 16, 'turned_on': True, 'intensity': 5}
    query = (f"UPDATE lights SET turned_on = %(turned_on)s, intensity = %(intensity)s WHERE light_id = %(light_id)s;")
    cursor.execute(query, query_data)

    cursor.execute(f"SELECT * FROM lights;")

    for result in cursor:
        print(result)

    

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