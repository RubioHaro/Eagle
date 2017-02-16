/* 
	TIPO: SCRIPT DE SQL
		//NEW LIGTHS\\
    //RUBIO HARO DIGITAL\\
    
    DESCRIPCION: Functions
    
*/
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


drop function if exists ModificarUsuario;
delimiter **
create function ModificarUsuario (IdUsuarior int(255), Nombrer nvarchar(200),Apellidopr nvarchar(100),Apellidomr nvarchar(100), mailr nvarchar (50)) returns nvarchar (200) 
begin
	update Usuarios set Usuarios.Nombre = Nombrer, Usuarios.Apellidop = Apellidopr, Usuarios.Apellidom = Apellidomr, Usuarios.mail = mailr where Usuarios.Idusuario = IdUsuarior;
    return 1;
end; **
delimiter ;


