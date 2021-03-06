/* 
	TIPO: SCRIPT DE SQL
		//NEW LIGTHS\\
    //RUBIO HARO DIGITAL\\
    
    DESCRIPCION: Hoja para procedimientos
    
*/
##*******************************************FUNCIONES********************************************************
drop database  if exists BDatos;
create database BDatos ;
use BDatos;
##  NORMAS PARA LOS ESTATUS USUARIO
##  0: No Disponible
##  1: Disponible
##  2: Eliminado
##	3: En mantenimiento

##  NORMAS PARA LOS ESTATUS SERVICIOS
##  0: No realizado
##  1: Realizado
##  2: Realizado y pagado
/*
-------------------------NivelAcceso-------------------------
Nivel de acceso para gestion de empleados para empleados:
Nivel 3: Altas, Bajas, Cambios y Consultas.
Nivel 2: Altas, Cambios y Consultas.
Nivel 1: Consultas.
Nivel 0: Sin acceso.
        -------------------------------------------------------------
*/

##						*********TABLAS*************




drop table if exists Imagenes;
create table Imagenes(
IdImagen int(10)auto_increment primary key ,
IdUsuario nvarchar(100) not null,
Estatus int (1)not null,
Costo int (100)not null,
Descripcion nvarchar(200) not null);

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
Pass nvarchar(32) not null,
Estatus int(1)not null
);

drop table if exists PageInfo_Catalogo;
create table PageInfo_Catalogo(
Version int(10)auto_increment primary key ,
Titulo nvarchar(100) not null,
Subtitulo nvarchar(100) not null,
IdModificador int (255),
foreign key(IdModificador) references Usuarios(Idusuario) on update cascade  on delete cascade);

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
IdDireccion int(255)not null primary key,
IdUsuario int(255)not null,
Tipo nvarchar(50),
Colonia nvarchar(200),
CP int(5),
NumeroExt int(100),
NumeroInt int(100),
Calle nvarchar(200),
Delegacion nvarchar(200),
foreign key(IdUsuario) references Usuarios(Idusuario) on update cascade  on delete cascade
);

drop table if exists Telefono;
create table Telefono(
IdUsuario int(255) not null primary key,
Telefono int(10)not null,
foreign key(IdUsuario) references Usuarios(Idusuario) on update cascade  on delete cascade
);

drop table if exists Servicios;
create table Servicios(
IdServicios int(255) auto_increment primary key ,
DescripcionServicio nvarchar(100) not null,
FechaSolicitud date not null,
FechaEntrega date not null,
Costo int(100) not null,
IdCliente int(255) not null,
IdUnidad int(255) not null,
IdDireccion int(255)not null,
Estatus nvarchar(100)not null,
foreign key(IdCliente) references Usuarios(Idusuario) on update cascade  on delete cascade,
foreign key(IdUnidad) references Unidades(IdUnidad) on update cascade  on delete cascade,
foreign key(IdDireccion) references Direccion(IdDireccion) on update cascade  on delete cascade);


create table Equipo (
IdEquipo int(5) auto_increment primary key,
Nombre varchar(30),
idUsuarioCreador int(5),
Estado int(5),
Tema varchar(20),
FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
foreign key (idUsuarioCreador) references Usuarios(IdUsuario));

create table Rel (
IdRel int(5) auto_increment primary key,
IdUsuario int(5),
IdEquipo int(5),
foreign key (IdUsuario) references Usuarios(IdUsuario)
on delete cascade on update cascade, 
foreign key (IdEquipo) references Equipo(IdEquipo) on delete cascade on update cascade); 

create table DocumentosEquipo (IdRel int(5) , 
URL varchar(50), 
IdUsuario int(5), 
IdEquipo int(5), 
foreign key (IdEquipo) references Equipo (IdEquipo)on delete cascade on update cascade, 
foreign key (IdRel) references Rel(IdRel) on delete cascade on update cascade);

create table MensajesEquipo (
Mensaje varchar(400), 
IdUsuario int(5), 
IdEquipo int(5), 
IdMensaje int(5) auto_increment primary key, 
foreign key (IdEquipo) references Equipo (IdEquipo) on delete cascade on update cascade);
