
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

##						*********TABLAS*************

drop table if exists PageInfo_Catalogo;
create table PageInfo_Catalogo(
Version int(10)auto_increment primary key ,
Titulo nvarchar(100) not null,
Subtitulo nvarchar(100) not null,
IdModificador int (255),
foreign key(IdModificador) references Usuarios(Idusuario) on update cascade  on delete cascade);

select * from PageInfo_Catalogo;
select *  from PageInfo_Catalogo order by Version desc limit 0,1;

drop table if exists Productos;
create table Productos(
IdProducto int(10)auto_increment primary key ,
Nombre nvarchar(100) not null,
Estatus int (1)not null,
Costo int (100)not null,
Descripcion nvarchar(200) not null);

drop table if exists Unidades;
create table Unidades(
IdUnidad int(255) not null primary key,
matricula nvarchar(6) not null,
marca nvarchar(100) not null,
modelo nvarchar(100) not null,
tipo nvarchar(100) not null,
puertas int(1) not null,
Blindaje nvarchar(100) not null,
Antiguedad year not null,
NumeroServicios int(100) not null,
Beneficios int(100) not null,
GananciaTotal nvarchar (100) not null,
Estatus int(1)not null
);

drop table if exists Usuarios;
create table Usuarios(
Idusuario int(255) not null primary key,
Nombre nvarchar(200) not null,
Apellidop nvarchar(100) not null,
Apellidom nvarchar(100) not null,
Tipo nvarchar(50) not null,
mail nvarchar (50) not null,
Pass nvarchar(200) not null,
Estatus int(1)not null
);

drop table if exists Empleados;
create table Empleados(
Idusuario int(255) not null primary key,
Antigüedad Date not null,
Tipo nvarchar (50) not null,
Salario int(10) not null,
Edad int(2) not null,
Sexo nvarchar (1) not null,
NivelAcceso nvarchar (1) not null,
foreign key(IdUsuario) references Usuarios(Idusuario) on update cascade  on delete cascade
);

drop table if exists Clientes;
create table Clientes(
Idusuario int(255) not null primary key,
NombreEmpresa nvarchar (200) not null,
FechaRegistro date not null,
foreign key(IdUsuario) references Usuarios(Idusuario) on update cascade  on delete cascade
);

drop table if exists Direccion;
create table Direccion(
IdDireccion int(255) not null primary key,
IdUsuario int(255) not null,
Tipo nvarchar(50) not null,
Colonia nvarchar(200) not null,
CP int(5)not null,
NumeroExt int(100) not null,
NumeroInt int(100) not null,
Calle nvarchar(200) not null,
Delegacion nvarchar(200) not null,
foreign key(IdUsuario) references Usuarios(Idusuario) on update cascade  on delete cascade
);

drop table if exists Telefono;
create table Telefono(
IdUsuario int(255) not null primary key,
Telefono int(10)not null,
foreign key(IdUsuario) references Usuarios(Idusuario) on update cascade  on delete cascade
);

drop table if exists Servicios;
create table Servicios(IdServicios int(255) auto_increment primary key ,DescripcionServicio nvarchar(100) not null,FechaSolicitud date not null,FechaEntrega date not null,Costo int(100) not null,IdCliente int(255) not null,IdUnidad int(255) not null,IdDireccion int(255)not null,Estatus int(1)not null,foreign key(IdCliente) references Usuarios(Idusuario) on update cascade  on delete cascade,foreign key(IdUnidad) references Unidades(IdUnidad) on update cascade  on delete cascade,foreign key(IdDireccion) references Direccion(IdDireccion) on update cascade  on delete cascade);
##*******************************************FUNCIONES********************************************************
drop function if exists AgregarUnidad;
delimiter **
create function AgregarUnidad (matricular nvarchar(6),marcar nvarchar(100),modelor nvarchar(100),tipor nvarchar(100),puertasr int(1),Blindajer nvarchar(100),Antiguedadr year(4),NumeroServiciosr int(100),Beneficiosr int(100),GananciaTotalr int(100),Estatusr int (1)) returns int(255) 
begin
	declare existe int;
	declare idUni int(255);
	set existe = (select count(*) from Unidades where matricula = matricular);
    
	if (existe = 0) then		
		set idUni = (select ifnull(max(IdUnidad), 0) + 1 from Unidades);					
        insert into Unidades(IdUnidad,matricula, marca, modelo, tipo, puertas, Blindaje, Antiguedad, NumeroServicios, Beneficios, GananciaTotal, Estatus )
				values(idUni,matricular, marcar, modelor, tipor, puertasr, Blindajer, Antiguedadr, NumeroServiciosr,Beneficiosr,GananciaTotalr, Estatusr);
	else
		set idUni = -1;        
	end if;
    return idUni;
end; **
delimiter ;


drop function if exists AgregarDireccion;
delimiter **
create function AgregarDireccion (IdUsuarior int(255),Tipor nvarchar(50),CPr int(5),NumeroExtr int(100),NumeroIntr int(100),Caller nvarchar(200),Coloniar nvarchar(200),Delegacionr nvarchar(200)) returns int(255) 
begin
	declare existe int;
	declare idDir int(255);
	set idDir = (select ifnull(max(IdDireccion), 0) + 1 from Direccion);    
    insert into Direccion(IdDireccion, IdUsuario, Tipo, Colonia, CP, NumeroExt, NumeroInt, Calle, Delegacion)
	values(idDir, IdUsuarior, Tipor, Coloniar, CPr, NumeroExtr, NumeroIntr, Caller, Delegacionr);
    return 0;
end; **
delimiter ;

drop function if exists CrearUsuario;
delimiter **
create function CrearUsuario (Nombrer nvarchar(200),Apellidopr nvarchar(100),Apellidomr nvarchar(100),Tipor nvarchar (50),mailr nvarchar (50),Passr nvarchar (200),Estatusr int (1),DirColoniar nvarchar(200),DirCPr int(5),DirNumeroExtr int(100),DirNumeroIntr int(100),DirCaller nvarchar(200),DirDelegacionr nvarchar(200)) returns int (20) 
begin
	declare existe int;
	declare idusr int(255);
    declare EstatusDireccion int;
	set existe = (select count(*) from Usuarios where mail = mailr);
	if (existe = 0) then
		set idusr = (select ifnull(max(Idusuario), 0) + 1 from Usuarios);
        insert into Usuarios(Idusuario,Nombre, Apellidop, Apellidom, Tipo, mail, Pass, Estatus)
				values(idusr,Nombrer, Apellidopr, Apellidomr, Tipor, mailr, Passr,Estatusr);
                
		set EstatusDireccion =AgregarDireccion(idusr,'Principal', DirCPr, DirNumeroExtr, DirNumeroIntr, DirCaller, DirColoniar, DirDelegacionr);
        if(EstatusDireccion != 0) then
			set idusr = -1;  
			set EstatusDireccion =-1;
        end if;
	else
		set idusr = -1;  
        set EstatusDireccion =-1;
	end if;
    return idusr + EstatusDireccion;
end; **
delimiter ;

##						*********PROCEDIMIENTOS*************
drop procedure if exists AgregarProducto;
delimiter **
create procedure AgregarProducto(Nombre nvarchar(100),Costo int(100),Descripcion nvarchar(200))
begin
		insert into Productos (Nombre,Estatus,Costo,Descripcion)values (Nombre,1,Costo,Descripcion);
end; **
delimiter ;

drop procedure if exists ProcedureCrearNuevaUnidad;
delimiter **
create procedure ProcedureCrearNuevaUnidad(matricular nvarchar(6),marcar nvarchar(100),modelor nvarchar(100),tipor nvarchar(100),puertasr int(1),Blindajer nvarchar(100),antiguedadr year ,Estatusr int(1))
begin
	declare msj nvarchar(100);
	declare IdUnidad int(255);
	set IdUnidad = AgregarUnidad(matricular,marcar,modelor,tipor,puertasr,Blindajer,antiguedadr,0,0,0,Estatusr) ;    
	if (IdUnidad >= 0) then
		set msj = 'Unidad Agregada';
	else		
        set msj = 'Ya existe la unidad';
	end if;
	
	select IdUnidad as IdUnidad, msj;
end; **
delimiter ;

drop procedure if exists ProcedureAgregarServicio;
delimiter **
create procedure ProcedureAgregarServicio(
DescripcionServicior nvarchar(100),FechaEntregar date,Costor int(100),IdClienter int(255),IdUnidadr int(255),IdDireccionr int(255))
begin
	declare msj nvarchar(100);
	declare IdUnidad int(255);    
	insert into Servicios (DescripcionServicio, FechaSolicitud, FechaEntrega, Costo, IdCliente, IdUnidad, IdDireccion, Estatus)
    values(DescripcionServicior, now(), FechaEntregar, Costor, IdClienter, IdUnidadr, IdDireccionr, 0);
end; **
delimiter ;

drop procedure if exists ProcedureGuardarEmpleado;
delimiter **
create procedure ProcedureGuardarEmpleado(in Nombrer nvarchar(200),in Apellidopr nvarchar(200),in Apellidomr nvarchar(100),in Antigüedadr date,in Tipor nvarchar (50),in Salarior int(10),in Edadr int(2),in Sexor nvarchar (1),in contrar nvarchar(32),in mailr nvarchar (50),in DirColoniar nvarchar(200),in DirCPr int(5),in DirNumeroExtr int(100),in DirNumeroIntr int(100),in DirCaller nvarchar(200),in DirDelegacionr nvarchar(200),in NivelAccesor int (2))
begin
	declare msj nvarchar(100);
    declare idusr int(255);    
	set idusr = CrearUsuario(Nombrer,Apellidopr,Apellidomr,'Colaborador',mailr,contrar,1,DirColoniar, DirCPr, DirNumeroExtr, DirNumeroIntr, DirCaller, DirDelegacionr) ;    
	if (idusr >= 0) then		
        insert into Empleados(Idusuario, Antigüedad, Tipo, Salario, Edad, Sexo, NivelAcceso)
			values(idusr, Antigüedadr, Tipor, Salarior, Edadr, Sexor, NivelAccesor);
		set msj = 'Registrado';
	else		
        set msj = 'Ya existe ese usuario';
	end if;
	
	select idusr as Idusuario, msj;
end; **
delimiter ;

drop procedure if exists ProcedureGuardarCliente;
delimiter **
create procedure ProcedureGuardarCliente(in Nombrer nvarchar(200),in Apellidopr nvarchar(200),in Apellidomr nvarchar(100),in NombreDeEmpresar nvarchar(100),in contrar nvarchar(32),in mailr nvarchar (50),in DirColoniar nvarchar(200),in DirCPr int(5),in DirNumeroExtr int(100),in DirNumeroIntr int(100),in DirCaller nvarchar(200),in DirDelegacionr nvarchar(200))
begin
	declare msj nvarchar(100);
	declare idusr int(255);
    set idusr = CrearUsuario(Nombrer,Apellidopr,Apellidomr,'Cliente',mailr,contrar,0,DirColoniar, DirCPr, DirNumeroExtr, DirNumeroIntr, DirCaller, DirDelegacionr) ;    
	if (idusr >= 0) then		
        insert into Clientes(Idusuario, NombreEmpresa,FechaRegistro)
			values(idusr, NombreDeEmpresar, now());
		set msj = 'Registrado';
	else		
        set msj = 'Ya existe ese usuario';
	end if;
	
	select idusr as Idusuario, msj;
end; **
delimiter ;

drop procedure if exists AñadirHeader;
delimiter **
create procedure AñadirHeader(
in Titulor nvarchar(200),
in Subtitulor nvarchar(200),
in IdModificadorr int(10))
begin
	insert into PageInfo_Catalogo (Titulo, Subtitulo, IdModificador) values (Titulor, Subtitulor, IdModificadorr);
end; **
delimiter ;


drop procedure if exists GetServices;
delimiter **
create procedure GetServices(
in Mail nvarchar(50))
begin
	SELECT Usuarios.Idusuario,Usuarios.Nombre,Usuarios.mail,Servicios.IdServicios,Servicios.DescripcionServicio,FechaSolicitud,FechaEntrega,Costo,Direccion.Delegacion,Direccion.Colonia,Direccion.CP,Direccion.Calle,Direccion.NumeroExt,Direccion.NumeroInt FROM Usuarios inner join Servicios on  Servicios.IdCliente = Usuarios.Idusuario inner join Direccion on  Direccion.Idusuario = Usuarios.Idusuario WHERE mail = Mail;
end; **
delimiter ;

drop procedure if exists GetCountservice;
delimiter **
create procedure GetCountservice(
in des nvarchar(100))
begin
	SELECT COUNT(IdServicios) FROM Servicios where DescripcionServicio = des;
end; **
delimiter ;




call GetAll50Services();
drop procedure if exists GetAll50Services;
delimiter **
create procedure GetAll50Services()
begin
	SELECT Usuarios.Idusuario,Usuarios.Nombre,Usuarios.mail,Servicios.IdServicios,Servicios.DescripcionServicio,FechaSolicitud,FechaEntrega,Costo,Direccion.Delegacion,Direccion.Colonia,Direccion.CP,Direccion.Calle,Direccion.NumeroExt,Direccion.NumeroInt FROM Usuarios inner join Servicios on  Servicios.IdCliente = Usuarios.Idusuario inner join Direccion on  Direccion.Idusuario = Usuarios.Idusuario ORDER BY IdServicios DESC LIMIT 50 ;
end; **
delimiter ;

drop procedure if exists EliminarProducto;
delimiter **
create procedure EliminarProducto(
in IdProductor int(10))
begin
	delete from bdatos.productos where idProducto = IdProductor;
end; **
delimiter ;

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