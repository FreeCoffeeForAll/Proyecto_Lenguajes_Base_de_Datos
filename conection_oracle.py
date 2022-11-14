import cx_Oracle

try:
    conexion= cx_Oracle.connect(
    user='Estudiante',
    password='123',
    dsn='localhost/orcl')

except  Exception as err:
    print('error en la conexion con la base de datos ',err)
else:
    print('Conectado a Oracle', conexion.version)






conexion.close();    