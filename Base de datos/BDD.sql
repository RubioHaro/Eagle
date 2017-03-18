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
call ProcedureGuardarEmpleado('Jorge ','Lozano' ,'Pascal','03-05-21','jefe',999999,65,'M','Jorge','Jorge@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Carlos ','Figueroa' ,'Palacios','03-05-21','jefe',999999,76,'M','Carlos','Carlos@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Ismail ','zoza' ,'Zuñiga','03-05-21','jefe',999999,65,'M','Ismail','Ismail@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Patricia ','Guerrero' ,'Aguilar','03-05-21','jefe',999999,34,'F','Patricia','Patricia@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Felipe ','Ruiz' ,'Cortinas','03-05-21','jefe',999999,28,'M','Felipe','Felipe@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Antonio ','Juarez' ,'Cisneros','03-05-21','jefe',999999,29,'M','mickybb','micky9qwe0@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Roberto ','Perez' ,'Valladolid','03-05-21','jefe',999999,30,'M','mickybb','mickyqwe10@hotfil.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Enrique ','Duran' ,'Ramirez','03-05-21','jefe',999999,20,'M','mickybb','micky9d10@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Angelica ','Rodriguz' ,'Dominguez','03-05-21','jefe',999999,22,'F','ange','ange@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Fatima ','Reyes' ,'Gomora','03-05-21','jefe',999999,23,'F','faty','faty@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Jessica ','Valdez' ,'Flores','03-05-21','jefe',999999,28,'F','jess','jess@hotmail.com','Tepeyac Insurgentes', 07020, 3451, 2, 'Arica', 'GAM',9);
call ProcedureGuardarEmpleado('Roy ','Rubio' ,'Haro','03-05-21','jefe',999999,41,'M','Roy123','Roy@gmail.com','Industrial', 07021, 3453, 2, 'Lidia', 'Miguel Hidalgo',1);
call ProcedureGuardarCliente('Zaza', 'gomez', 'Garibay', 'Bimbo', 'ZAZABB', 'zazaBB@zazamail.com','Azcapotzalco', 12312, 1212, 3, 'Juarez', 'Centro');
call ProcedureCrearNuevaUnidad('CDM198','volkswagen','Passat','coche',4,'39mm',1999,1);
call ProcedureAgregarServicio('Transporte ', '10-2-9', 20000, 2, 1, 2);
call ProcedureAgregarServicio('Custodia ', '10-2-9', 20000, 2, 1, 2);
call AgregarProducto('Transporte',20000,'Custodia de vehiculos');
call ActualizarContraseña(1,123);
call GetServices('zazaBB@zazamail.com');
call ContarColaboradoresHombres;
call ContarColaboradoresMujeres;
call EliminarProducto(3);
call AñadirHeader('Premium Services', '+options',1);
call GetAges;
call GetEmpleado('zazabb@gmail.com');
call GetClient('chavo0022009@hotmail.com');
call ValidarPassword(1,'123');
call GetIdByEmail('micky90210@hotmail.com');
select * from PageInfo_Catalogo;
select * from Usuarios;
select * from Empleados;
select * from Direccion;
select * from Clientes;
select * from Unidades;
select * from Servicios;
select * from Productos;

SELECT count(DISTINCT edad)  FROM Empleados;
SELECT * FROM Empleados WHERE Idusuario =  1;
SELECT * FROM Usuarios WHERE mail = 'zazabb@gmail.com';
