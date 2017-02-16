
drop database  if exists BDatos;
create database BDatos ;
use BDatos;
##  NORMAS PARA LOS ESTATUS USUARIO
##  0: No habilitado
##  1: Habilitado
##  2: Eliminado
##  3: No encontrado

##  NORMAS PARA LOS ESTATUS USUARIO
##  0: No Disponible
##  1: Disponible
##  2: Eliminado
##	3: En mantenimiento

##  NORMAS PARA LOS ESTATUS SERVICIOS
##  0: No realizado
##  1: Realizado
##  2: Realizado y pagado

##						*********PRUEBAS*************																																															
call ProcedureGuardarEmpleado('Migue ','Perez' ,'Cisneros','03-05-21','jefe',999999,23,'M','mickybb','micky90210@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Roy ','Rubio' ,'Haro','03-05-21','jefe',999999,24,'M','Roy123','Roy@gmail.com','Industrial', 07021, 3453, 2, 'Lidia', 'Miguel Hidalgo',1);
call ProcedureGuardarCliente('Zaza', 'gomez', 'Garibay', 'Bimbo', 'ZAZABB', 'zazaBB@zazamail.com','Azcapotzalco', 12312, 1212, 3, 'Juarez', 'Centro');
call ProcedureCrearNuevaUnidad('CDM198','volkswagen','Passat','coche',4,'39mm',1999,1);
call ProcedureAgregarServicio('Transporte ', '10-2-9', 20000, 2, 1, 2);
call ProcedureAgregarServicio('Custodia ', '10-2-9', 20000, 2, 1, 2);
call AgregarProducto('Transporte',20000,'Custodia de vehiculos');
call GetServices('zazaBB@zazamail.com');

call EliminarProducto(3);
call AñadirHeader('Premium Services', '+options',1);
select * from PageInfo_Catalogo;
select * from Usuarios;
select * from Empleados;
select * from Direccion;
select * from Clientes;
select * from Unidades;
select * from Servicios;
select * from Productos;

SELECT * FROM Usuarios WHERE mail = 'zazabb@gmail.com';