import mysql.connector

data = []

class MyDatabase:
    def open_connection(self):
        connection = mysql.connector.connect( 
            host="localhost",                    
            user="root", 
            passwd="", 
            database="db_lo_de_mary")
        return connection

    def insert_db(self, nombre, apellido, direccion, telefono, rtn, cuenta_bancaria, edad, bloque_casa):
        my_connection = self.open_connection()
        cursor = my_connection.cursor()
        query = "INSERT INTO tbl_empleados(NOMBRE, APELLIDO, DIRECCION, TELEFONO, RTN, CUENTA_BANCARIA, EDAD, BLOQUE_CASA) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
        data = (nombre, apellido, direccion, telefono, rtn, cuenta_bancaria, edad, bloque_casa)
        cursor.execute(query, data)
        my_connection.commit()
        my_connection.close()

    def read_db(self):
        my_connection = self.open_connection()
        cursor = my_connection.cursor()
        query = "SELECT NOMBRE, APELLIDO, DIRECCION, TELEFONO, RTN, CUENTA_BANCARIA, EDAD, BLOQUE_CASA FROM TBL_EMPLEADOS"
        cursor.execute(query)
        registro = 0
        for fila in cursor:
            data.append(fila) 
            print('for - ' + str(registro) +" - "+ str(data[registro]))
            registro = registro + 1 
        
        my_connection.close()     
        #print(data)

    def delete_db(self):
        my_connection = self.open_connection()   
        cursor = my_connection.cursor()  
        query = "DELETE ...."
        cursor.execute(query)