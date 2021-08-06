from tkinter import*
from tkinter import messagebox
import tkinter
import database

win=Tk()
win.title("INGRESO DE EMPLEADOS")
win.resizable(False,False)
win.geometry("390x480")
win.config(bg="#FF4500")

def crear_usuario():
        nombre = entry_nombre.get()
        apellido = entry_apellido.get()
        direccion = entry_direccion.get()
        telefono = entry_telefono.get()
        rtn = entry_rtn.get()
        cuenta_bancaria = entry_cuenta_bancaria.get()
        edad = entry_edad.get()
        bloque_casa = entry_bloque_casa.get()
        database_db = database.MyDatabase()
        database_db.insert_db(nombre, apellido, direccion, telefono, rtn, cuenta_bancaria, edad, bloque_casa)
        import mysql.connector
        connection =mysql.connector.connect(host="localhost", 
                                        user="root", 
                                        passwd="", 
                                        database="db_database")
        cursor = connection.cursor()
        cursor.execute("SELECT NOMBRE, APELLIDO, DIRECCION, TELEFONO, RTN, CUENTA_BANCARIA, EDAD, BLOQUE_CASA FROM TBL_EMPLEADOS")
            
        my_table = ttk.Treeview(window)
            
        registro=0
        for fila in cursor:
            registro=registro+1
            print(str(registro) + "-"+str(fila))
            nombre = fila[0]  
            apellido = fila[1]
            direccion = fila[2] 
            telefono = fila[3] 
            rtn = fila[4] 
            cuenta_bancaria = fila[5] 
            edad = fila[6] 
            bloque_casa = fila[7] 
            my_table.insert(parent="", index="end", iid=registro, text=str(registro),
                values=(nombre, apellido, direccion, telefono, rtn, cuenta_bancaria, edad, bloque_casa))
        connection.close() 
        
                # Define Our Columns 
        my_table['columns'] = ('NOMBRE', 'APELLIDO', 'DIRECCION', 'TELEFONO', 'RTN', 'CUENTA_BANCARIA', 'EDAD', 'BLOQUE_CASA')
        
                # Formate Our Columns
        my_table.column('#0', width=120, minwidth=50)
        my_table.column('NOMBRE', anchor=W, width=120)
        my_table.column('APELLIDO', anchor=W, width=120)
        my_table.column('DIRECCION', anchor=W, width=120)
        my_table.column('TELEFONO', anchor=W, width=120)
        my_table.column('RTN', anchor=W, width=120)
        my_table.column('CUENTA_BANCARIA', anchor=W, width=120)
        my_table.column('EDAD', anchor=W, width=120)
        my_table.column('BLOQUE_CASA', anchor=W, width=120)
                # Create Headings
        my_table.heading('#0', text='ID_CAMPO', anchor=W)
        my_table.heading('NOMBRE', text='NOMBRE', anchor=W)
        my_table.heading('APELLIDO', text='APELLIDO', anchor=W)
        my_table.heading('DIRECCION', text='DIRECCION', anchor=W)
        my_table.heading('TELEFONO', text='TELEFONO', anchor=W)
        my_table.heading('RTN', text='RTN', anchor=W)
        my_table.heading('CUENTA_BANCARIA', text='CUENTA_BANCARIA', anchor=W)
        my_table.heading('EDAD', text='EDAD', anchor=W)
        my_table.heading('BLOQUE_CASA', text='BLOQUE_CASA', anchor=W)

        my_table.place(x=400, y=350)
        #fin

label_empleados1=Label(win, text="Registro de Empleados", font=("Calibri","18", "bold"),bg="#FF4500", fg="white", justify=CENTER)
label_empleados1.pack()

label_nombre=Label(win,text="NOMBRE: ", font=("Calibri", "14"), bg="#FF4500")
label_nombre.place(x=5,y=50)
entry_nombre=Entry(win, font=("Calibri","14"))
entry_nombre.place(x=90, y=50)

label_apellido=Label(win,text="APELLIDO: ", font=("Calibri", "14"), bg="#FF4500")
label_apellido.place(x=5,y=90)
entry_apellido=Entry(win, font=("Calibri","14"))
entry_apellido.place(x=100, y=90)

label_edad=Label(win,text="EDAD: ", font=("Calibri", "14"), bg="#FF4500")
label_edad.place(x=5,y=130)
entry_edad=Entry(win, font=("Calibri","14"))
entry_edad.place(x=65, y=130)

label_direccion=Label(win,text="DIRECCIÓN: ", font=("Calibri", "14"), bg="#FF4500")
label_direccion.place(x=5,y=170)
entry_direccion=Entry(win, font=("Calibri","14"))
entry_direccion.place(x=110, y=170)

label_telefono=Label(win,text="TELEFONO: ", font=("Calibri", "14"), bg="#FF4500")
label_telefono.place(x=5,y=210)
entry_telefono=Entry(win, font=("Calibri","14"))
entry_telefono.place(x=100, y=210)

label_rtn=Label(win, text="RTN: ", bg="#FF4500", font=("Calibri", "14"))
label_rtn.place(x=5, y=250)
entry_rtn=Entry(win, font=("Calibri", "14"))
entry_rtn.place(x=50, y=250)

label_bloque=Label(win, text="BLOQUE DE CASA: ", bg="#FF4500", font=("Calibri", "14"))
label_bloque.place(x=5, y=290)
entry_bloque=Entry(win, font=("Calibri", "14"))
entry_bloque.place(x=155, y=290)

label_cuenta=Label(win, text="CUENTA: ", bg="#FF4500", font=("Calibri", "14"))
label_cuenta.place(x=5, y=330)
entry_cuenta=Entry(win, font=("Calibri", "14"))
entry_cuenta.place(x=85, y=330)

boton_agregar_info=Button(win,text="solicitar pedido", font=("Calibri", "14"), bg="SandyBrown", background="#FE9520")
boton_agregar_info.place(x=130,y=400)


win.mainloop()