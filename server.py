import http.server
import socketserver
import json

# Crear la tabla en la base de datos
import mysql.connector

# Crear la conexión a la base de datos
connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='n0m3l0',
    database='EverythingWorks',
    charset='utf8mb4'
)

try:
    with connection.cursor() as cursor:
        # Crear la tabla
        create_table_sql = '''
        CREATE TABLE Chat2 (
            Id_Chat INT,
            Id_Usu INT,
            Id_Usu2 INT,
            Mensaje VARCHAR(80)
        )
        '''
        cursor.execute(create_table_sql)

        # Insertar datos en la tabla
        insert_data_sql = '''
        INSERT INTO Chat2 (Id_Chat, Id_Usu, Id_Usu2, Mensaje)
        VALUES (2, 1, 2, 'Sexo:Masculino'),
        (1, 1, 2, 'Sexo:Masculino')
        '''

        cursor.execute(insert_data_sql)

    connection.commit()
finally:
    connection.close()

# Definir el manejador de solicitudes
class RequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/registros':
            connection = mysql.connector.connect(
                host='localhost',
                user='root',
                password='n0m3l0',
                database='EverythingWorks',
                charset='utf8mb4'
            )
            try:
                with connection.cursor() as cursor:
                    sql = "SELECT * FROM Chat2"
                    cursor.execute(sql)
                    result = cursor.fetchall()

                    # Crear una lista de diccionarios para los registros
                    registros = []
                    for row in result:
                        registro = {
                            'Id_Chat': row[0],
                            'Id_Usu': row[1],
                            'Id_Usu2': row[2],
                            'Mensaje': row[3]
                        }
                        registros.append(registro)

                    response = json.dumps(registros)

                    # Agregar el encabezado "Access-Control-Allow-Origin"
                    self.send_response(200)
                    self.send_header('Content-type', 'application/json')
                    self.send_header('Access-Control-Allow-Origin', '*')  # Permitir todas las solicitudes desde cualquier origen
                    self.send_header('Content-Length', len(response))
                    self.end_headers()
                    self.wfile.write(response.encode('utf-8'))
            finally:
                connection.close()
        else:
            self.send_response(404)
            self.end_headers()

# Iniciar el servidor
port = 5501
with socketserver.TCPServer(("", port), RequestHandler) as httpd:
    print(f"Servidor iniciado en el puerto {port}")
    httpd.serve_forever()
