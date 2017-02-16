/* 
	TIPO: SCRIPT DE SQL
		//NEW LIGTHS\\
    //RUBIO HARO DIGITAL\\
    
    DESCRIPCION: Hoja para procedimientos
    
*/

/*		Procedimiento: Agregar Producto 		*/
drop procedure if exists AgregarProducto;
delimiter **
create procedure AgregarProducto(Nombre nvarchar(100),Costo int(100),Descripcion nvarchar(200))
begin
		insert into Productos (Nombre,Estatus,Costo,Descripcion)values (Nombre,1,Costo,Descripcion);
end; **
delimiter ;

/*		Procedimiento: Agregar Vehiculo al inventario 		*/
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

/*		Procedimiento: Agregar Servicio a la bitacora 		*/
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


/*		Procedimiento: Agregar Empleado al registro 		*/
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

/*		Procedimiento: Modificar al Empleado del registro 		*/
drop procedure if exists ProcedureModificarEmpleado;
delimiter **
create procedure ProcedureModificarEmpleado(in Nombrer nvarchar(200),in Apellidopr nvarchar(200),
in Apellidomr nvarchar(100),in mailr nvarchar (50),in Antiguedad date, in Poscicion nvarchar(100), in Salario int(10), in Edad int(2), in Sexo nvarchar(1
))
begin
	declare msj nvarchar(100);	
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

/*		Procedimiento: Agregar Cliente al catalogo de clientes 		*/
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


/*		Procedimiento: Agregar Cabecera al sitio web 		*/
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

/*		Procedimiento: Obtener los servicios 		*/
drop procedure if exists GetServices;
delimiter **
create procedure GetServices(
in Mail nvarchar(50))
begin
	SELECT Usuarios.Idusuario,Usuarios.Nombre,Usuarios.mail,Servicios.IdServicios,Servicios.DescripcionServicio,FechaSolicitud,FechaEntrega,Costo,Direccion.Delegacion,Direccion.Colonia,Direccion.CP,Direccion.Calle,Direccion.NumeroExt,Direccion.NumeroInt FROM Usuarios inner join Servicios on  Servicios.IdCliente = Usuarios.Idusuario inner join Direccion on  Direccion.Idusuario = Usuarios.Idusuario WHERE mail = Mail;
end; **
delimiter ;

/*		Procedimiento: Contar los servicios 		*/
drop procedure if exists GetCountservice;
delimiter **
create procedure GetCountservice(
in des nvarchar(100))
begin
	SELECT COUNT(IdServicios) FROM Servicios where DescripcionServicio = des;
end; **
delimiter ;

/*		Procedimiento: Obtener ultimos 50 servicios 		*/
drop procedure if exists GetAll50Services;
delimiter **
create procedure GetAll50Services()
begin
	SELECT Usuarios.Idusuario,Usuarios.Nombre,Usuarios.mail,Servicios.IdServicios,Servicios.DescripcionServicio,FechaSolicitud,FechaEntrega,Costo,Direccion.Delegacion,Direccion.Colonia,Direccion.CP,Direccion.Calle,Direccion.NumeroExt,Direccion.NumeroInt FROM Usuarios inner join Servicios on  Servicios.IdCliente = Usuarios.Idusuario inner join Direccion on  Direccion.Idusuario = Usuarios.Idusuario ORDER BY IdServicios DESC LIMIT 50 ;
end; **
delimiter ;


/*		Procedimiento: Eliminar producto 		*/
drop procedure if exists EliminarProducto;
delimiter **
create procedure EliminarProducto(
in IdProductor int(10))
begin
	delete from bdatos.productos where idProducto = IdProductor;
end; **
delimiter ;

/* Procedimiento: Eliminar Unidad */
drop procedure EliminarUnidad;
delimiter **
create procedure EliminarUnidad(
in IdUnidad int(100))
begin
	delete from bdatos.unidades where IdUnidad = IdUnidad;
end; **
delimiter ;

/*		Procedimiento: Actualizar Usuario		*/
drop procedure if exists ActualizarUsuario;
delimiter **
create procedure ActualizarUsuario(in IdUsuario int(255), in Nombrer nvarchar(200),in Apellidopr nvarchar(200),in Apellidomr nvarchar(100),in mailr nvarchar (50))
begin
	select ModificarUsuario( IdUsuario, Nombrer, Apellidopr, Apellidomr, mailr);	
end; **
delimiter ;




