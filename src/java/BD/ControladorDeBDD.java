/*
 * New Ligths
 * Services info Web
 * Rubio Haro 
 */
package BD;

import Activacion.Mail;
import Catalogo.ListOfproducts;
import Catalogo.Producto;
import Servicios.ListaServicios;
import Servicios.Servicio;
import Unidades.Unidad;
import Usuarios.Cliente;
import Usuarios.Direccion;
import Usuarios.Empleado;
import Usuarios.TicketDeUsuarios;
import Usuarios.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * JAVA CLASS
 *
 * @author Rod
 */
public class ControladorDeBDD {

    private Usuario user;
    private String Query;
    private Unidad Unit;
    private ResultSet res;
    private ResultsSetDB ResDB;
    private final ControladorDeConexion Control;
    private PreparedStatement EstamentoPreparado;

    public ControladorDeBDD() {
        Control = new ControladorDeConexion();
        ResDB = new ResultsSetDB();
    }
    
    public ResultsSetDB BuscarUnidad(String Parametro, String Filtro) throws ClassNotFoundException {
        ResDB = null;
        ResDB = new ResultsSetDB();

        System.out.println("Generando Query...");

        Query = "SELECT * FROM Unidades  WHERE Unidades." + Filtro + " = '" + Parametro + "'; ";

        System.out.println("Query Generado Con exito: " + Query);
        try {
            System.out.print("Generado conexion:");
            Control.CrearConexion();
            res = Control.SentenciaSQL(Query);
            Unit = new Unidad();
            System.out.print("MySQL server connected");
            if (res.next()) {
                Unit.setIdUnidad(res.getInt(1));
                Unit.setMatricula(res.getString(2));
                Unit.setMarca(res.getString(3));
                Unit.setModelo(res.getString(4));
                Unit.setTipo(res.getString(5));
                Unit.setPuertas(res.getInt(6));
                Unit.setBlindaje(res.getString(7));
                Unit.setAntiguedad(res.getString(8));
                Unit.setEstatus(res.getString(9));
                ResDB.setCondicion(Boolean.TRUE);
                ResDB.setEstaus("Unidad Obtenida");
                ResDB.setUnit(Unit);

            }
            Control.CerrarConexion();
            res.close();
            System.out.println("Conexiones Finalizadas con exito");
        } catch (SQLException ex) {
            ResDB.setCondicion(Boolean.FALSE);
            ResDB.setEstaus("DB error: " + ex.toString());
            ResDB.AgregarError();
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ResDB;
    }
    
    public String RegistrarUnidad(String Matricula, String Marca, String Modelo, String Tipo, String Puertas, String Blindaje, String Antiguedad, String Status) throws ClassNotFoundException {

        String mensj;
        try {
            Control.CrearConexion();
            Query = "call ProcedureCrearNuevaUnidad(?,?,?,?,?,?,?,?);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, Matricula);
            EstamentoPreparado.setString(2, Marca);
            EstamentoPreparado.setString(3, Modelo);
            EstamentoPreparado.setString(4, Tipo);
            EstamentoPreparado.setString(5, Puertas);
            EstamentoPreparado.setString(6, Blindaje);
            EstamentoPreparado.setString(7, Antiguedad);
            EstamentoPreparado.setString(8, Status);
            EstamentoPreparado.executeUpdate();
            EstamentoPreparado.close();
            Control.CerrarConexion();
            mensj = "La unidad ha sido registrada";

        } catch (SQLException ex) {
            mensj = "La Unidad a sido registrada:" + ex.toString();
        }
        return mensj;
    }

     public String EliminarUnidad(int ID) throws ClassNotFoundException, SQLException {
        try {
            Control.CrearConexion();
            Query = "call EliminarUnidad(?);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setInt(1, ID);
            EstamentoPreparado.executeUpdate();
            Control.CerrarConexion();
            return "La Unidad a sido eliminado";

        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return "Error: " + error.toString();
        } catch (ClassNotFoundException error) {
            System.out.println("Error: " + error.getLocalizedMessage());
            return "Error: " + error.toString();
        }
    }
     
    public boolean ConsultarExUser(int IdUsuario) throws ClassNotFoundException {
        //Revisa si el usuario si existe
        ResDB = null;
        ResDB = new ResultsSetDB();
        Query = "SELECT * FROM Usuarios WHERE IdUsuario = '" + IdUsuario + "'; ";
        try {
            Control.CrearConexion();
            res = Control.SentenciaSQL(Query);
            return res.next();
        } catch (SQLException ex) {
            System.out.println("Error al consultar usuario:" + ex.getMessage());
            return false;
        }
    }

    public TicketDeUsuarios ObtenerListaDeColaboradores(int LimiteDeRegistros) {
        ResDB.CrearListaDeUsuarios();
        Query = "SELECT * FROM Usuarios inner join Empleados where usuarios.Idusuario = Empleados.Idusuario limit " + LimiteDeRegistros + ";";
        try {
            Control.CrearConexion();
            res = Control.SentenciaSQL(Query);

            while (res.next()) {
                user = new Usuario();
                user.setIdusuario(res.getInt(1));
                user.setNombre(res.getString(2));
                user.setApellidop(res.getString(3));
                user.setApellidom(res.getString(4));
                user.setTipo(res.getString(5));
                user.setMail(res.getString(6));
                user.setEstatus(res.getInt(8));
                ResDB.setCondicion(Boolean.TRUE);
                ResDB.setEstaus("Usuarios Obtenidos");
                ResDB.AñadirUsuarioALista(user);
            }
            Control.CerrarConexion();
            res.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ResDB.getListaUsuarios();
    }

    public TicketDeUsuarios ObtenerListaDeClientes(int LimiteDeRegistros) {
        ResDB.CrearListaDeUsuarios();
        Query = "SELECT * FROM Usuarios inner join Clientes where usuarios.Idusuario = Clientes.Idusuario limit " + LimiteDeRegistros + ";";
        try {
            Control.CrearConexion();
            res = Control.SentenciaSQL(Query);

            while (res.next()) {
                user = new Usuario();
                user.setIdusuario(res.getInt(1));
                user.setNombre(res.getString(2));
                user.setApellidop(res.getString(3));
                user.setApellidom(res.getString(4));
                user.setTipo(res.getString(5));
                user.setMail(res.getString(6));
                user.setEstatus(res.getInt(8));
                ResDB.setCondicion(Boolean.TRUE);
                ResDB.setEstaus("Usuarios Obtenidos");

                ResDB.AñadirUsuarioALista(user);
            }
            Control.CerrarConexion();
            res.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ResDB.getListaUsuarios();
    }

    public Empleado BuscarEmpleado(String IdUsuario) {
        try {
            ResDB = new ResultsSetDB();
            ResDB = BuscarUsuario(IdUsuario, "x", "x");
            return ResDB.getCollaborator();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultsSetDB BuscarUsuario(String Parametro, String Filtro, String ClienteEmpleado) throws ClassNotFoundException {
        ResDB = null;
        ResDB = new ResultsSetDB();

        if (ClienteEmpleado.equals("x")) {
            Query = "SELECT * FROM Usuarios WHERE Usuarios.Idusuario = '" + Parametro + "' ;";
        } else if (Filtro.equals("Nombre")) {
            Query = "SELECT * FROM Usuarios inner join " + ClienteEmpleado + "s on " + ClienteEmpleado + "s.Idusuario = Usuarios.Idusuario WHERE Usuarios." + Filtro + " = '" + Parametro + "' or \"Usuarios.Apellidop\" = '" + Parametro + "' or \"Usuarios.Apellidom\" = '" + Parametro + "' ; ";
        } else {
            Query = "SELECT * FROM Usuarios inner join " + ClienteEmpleado + "s on " + ClienteEmpleado + "s.Idusuario = Usuarios.Idusuario WHERE Usuarios." + Filtro + " = '" + Parametro + "'; ";
        }
        try {

            Control.CrearConexion();
            res = Control.SentenciaSQL(Query);
            user = new Usuario();

            while (res.next()) {
                user.setIdusuario(res.getInt(1));
                user.setNombre(res.getString(2));
                user.setApellidop(res.getString(3));
                user.setApellidom(res.getString(4));
                user.setTipo(res.getString(5));
                user.setMail(res.getString(6));
                user.setEstatus(res.getInt(8));
                //System.out.println(user.getTipo());
                if (user.getTipo().equals("Colaborador")) {
                    Empleado collaborator = new Empleado(user);

                    Query = "SELECT * FROM Empleados WHERE Idusuario = \"" + user.getIdusuario() + "\"; ";
                    //System.out.println("Empleado Encontrado, nuevo query generado: " + Query);
                    //System.out.println("Generando Nueva Conexion...");
                    //System.out.println("Conexion Generada");
                    try (ResultSet res2 = Control.SentenciaSQL(Query)) {
                        if (res2.next()) {
                            //NO usamos el res.1 por que ya conocemos el id
                            collaborator.setAntiguedad(res2.getString(2));
                            collaborator.setPoscicion(res2.getString(3));
                            collaborator.setSalario(res2.getInt(4));
                            collaborator.setEdad(res2.getInt(5));
                            collaborator.setSexo(res2.getString(6));
                            user.setNivelAcceso(res2.getInt(7));
                            ResDB.setCollaborator(collaborator);
                            ResDB.setClient(null);
                            //System.out.println("User Getter");
                        }

                    }
                } else if (user.getTipo().equals("Cliente")) {
                    user.setNivelAcceso(0);
                    Cliente client = new Cliente(user);
                    Query = "SELECT * FROM Clientes WHERE Idusuario = \"" + user.getIdusuario() + "\"; ";
                    //System.out.println("Empleado Encontrado, nuevo query generado: " + Query);
                    //System.out.println("Generando Nueva Conexion...");
                    //System.out.println("Conexion Generada");
                    try (ResultSet res2 = Control.SentenciaSQL(Query)) {
                        if (res2.next()) {
                            //NO usamos el res.1 por que ya conocemos el id
                            client.setCliente(res2.getString(2));
                            client.setFechaRegistro(res2.getString(3));
                            ResDB.setClient(client);
                            ResDB.setCollaborator(null);
                            //System.out.println("User Getter");
                        }

                    }
                }

                ResDB.setCondicion(Boolean.TRUE);
                ResDB.setEstaus("Usuario Obtenido");

                ResDB.setUser(user);

                ResDB.CrearListaDeUsuarios();
                ResDB.AñadirUsuarioALista(user);

            }
            Control.CerrarConexion();
            res.close();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.toString() + ex.getLocalizedMessage());
            ResDB.setCondicion(Boolean.FALSE);
            ResDB.setEstaus("DB error: " + ex.toString());
            ResDB.AgregarError();
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ResDB;
    }

    public String ModificarUsuario(String PasswordModificador, String IdUsuarioModificador, String IdUsuario, String Nombre, String apellidoP, String apellidoM, String Email) throws ClassNotFoundException {
        String mensj;
        try {
            Control.CrearConexion();

            Query = "call ActualizarUsuario(?,?,?,?,?)";
            EstamentoPreparado = Control.StatmentAction(Query);
            System.out.println(IdUsuario);
            EstamentoPreparado.setInt(1, Integer.parseInt(IdUsuario));
            EstamentoPreparado.setString(2, Nombre);
            EstamentoPreparado.setString(3, apellidoP);
            EstamentoPreparado.setString(4, apellidoM);
            EstamentoPreparado.setString(5, Email);
            EstamentoPreparado.executeUpdate();
            EstamentoPreparado.close();
            Control.CerrarConexion();
            mensj = "El usuario ha sido actualizado";
        } catch (SQLException ex) {
            mensj = "Ha ocurrido un error:" + ex.toString();
        }
        return mensj;
    }

    public String RegistrarCliente(String Nombre, String apellidoP, String apellidoM, String Empresa, String Pass, String Mail, String colonia, int codigoPostal, int NumExt, int NumInt, String Calle, String delegacion) throws ClassNotFoundException {
        String mensj;
        try {
            Control.CrearConexion();
            Query = "call ProcedureGuardarCliente(?,?,?,?,?,?,?,?,?,?,?,?);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, Nombre);
            EstamentoPreparado.setString(2, apellidoP);
            EstamentoPreparado.setString(3, apellidoM);
            EstamentoPreparado.setString(4, Empresa);
            EstamentoPreparado.setString(5, Pass);
            EstamentoPreparado.setString(6, Mail);
            EstamentoPreparado.setString(7, colonia);
            EstamentoPreparado.setInt(8, codigoPostal);
            EstamentoPreparado.setInt(9, NumExt);
            EstamentoPreparado.setInt(10, NumInt);
            EstamentoPreparado.setString(11, Calle);
            EstamentoPreparado.setString(12, delegacion);
            EstamentoPreparado.executeUpdate();
            EstamentoPreparado.close();
            Control.CerrarConexion();
            mensj = "Has sido registrado, consulta tu email para activar la cuenta";
            Mail correo = new Mail();
            correo.mensajeDeVerificacion(Mail);
        } catch (SQLException ex) {
            mensj = "Ha ocurrido un error:" + ex.toString();
        }
        return mensj;
    }

    //Para Iniciar sesion
    public ResultsSetDB IniciarSesion(String Mail, String Pass) throws ClassNotFoundException {
        ResDB = null;
        try {
            ResDB = new ResultsSetDB();
            ResDB.setCondicion(Boolean.FALSE);
            ResDB.setEstaus("");
            Control.CrearConexion();
            Query = "SELECT * FROM Usuarios WHERE mail = \"" + Mail + " \"; ";
            res = Control.SentenciaSQL(Query);
            user = new Usuario();
            if (res.next()) {
                user.setIdusuario(res.getInt(1));
                user.setNombre(res.getString(2));
                user.setApellidop(res.getString(3));
                user.setApellidom(res.getString(4));
                user.setTipo(res.getString(5));
                user.setMail(res.getString(6));
                user.setEstatus(res.getInt(8));

                if (user.getEstatus() != 1) {
                    ResDB.setEstaus("Activa tu cuenta (revisa tu email o consulta con el administrador)");
                    ResDB.AgregarError();
                } else if (Pass.equals(res.getString("Pass"))) {
                    ResDB.setCondicion(Boolean.TRUE);
                    ResDB.setEstaus("Iniciando Sesion...");
                    ResDB.setUser(user);
                } else {
                    ResDB.setEstaus("Contraseña Incorrecta");
                    ResDB.AgregarError();
                }
                //Se cierra Aqeui para abrir una nueva conexion con otra sentencia
                res.close();
                Control.CerrarConexion();
                //Para definir el Nivel de Acceso
                if (user.getTipo().equals("Colaborador")) {
                    Control.CrearConexion();
                    Query = "SELECT NivelAcceso FROM Usuarios inner join Empleados on Empleados.Idusuario = Usuarios.Idusuario WHERE mail = \"" + Mail + " \"; ";
                    res = Control.SentenciaSQL(Query);
                    if (res.next()) {
                        user.setNivelAcceso(res.getInt(1));
                    }
                    Control.CerrarConexion();
                } else {
                    user.setNivelAcceso(0);
                }

            } else {
                ResDB.setEstaus("Usuario NO encontrado");
                ResDB.AgregarError();
                Control.CerrarConexion();
            }

        } catch (SQLException ex) {
            ResDB.setEstaus("DB error: " + ex.toString());
            ResDB.AgregarError();
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ResDB;
    }

    public String ActivarUsuario(String Mail) throws ClassNotFoundException, SQLException {
        String mensaje;
        ResDB = null;
        ResDB = BuscarUsuario(Mail, "Mail", "Empleado");
        if (ResDB.getErrores() != 0) {
            mensaje = ResDB.getEstaus();
        } else {
            Usuario Cliente;
            Cliente = ResDB.getUser();
            mensaje = ActualizarUsuarioConMail(Cliente.getNombre(), Cliente.getApellidop(), Cliente.getApellidom(), Cliente.getMail(), 1);
        }
        return mensaje;
    }

    public String ActualizarUsuarioConMail(String Nombre, String apellidoP, String apellidoM, String Mail, int Estatus) throws ClassNotFoundException, SQLException {
        try {

            Control.CrearConexion();
            Query = "select ModificarUsuario(?,?,?,?,?,?);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, Nombre);
            EstamentoPreparado.setString(2, apellidoP);
            EstamentoPreparado.setString(3, apellidoM);
            EstamentoPreparado.setInt(4, Estatus);
            EstamentoPreparado.setString(5, Mail);
            EstamentoPreparado.setString(6, Mail);
            EstamentoPreparado.executeUpdate();
            EstamentoPreparado.close();
            Control.CerrarConexion();
            return "Usuario Actualizado";

        } catch (SQLException error) {
            return "Error:" + error.toString();
        } catch (ClassNotFoundException e) {
            return "Error:" + e.getLocalizedMessage();

        }
    }
    //INSERTAR USUARIO
    public String AgregarEmpleado(String Nombre, String apellidoP, String apellidoM, String Antiguedad, String Tipo, int salario, int Edad, String Sexo, String Pass, String Mail, String colonia, int codigoPostal, int NumExt, int NumInt, String Calle, String delegacion, int NivelAcceso) throws ClassNotFoundException, SQLException {

        try {
            Control.CrearConexion();
            Query = "call ProcedureGuardarEmpleado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, Nombre);
            EstamentoPreparado.setString(2, apellidoP);
            EstamentoPreparado.setString(3, apellidoM);
            EstamentoPreparado.setString(4, Antiguedad);
            EstamentoPreparado.setString(5, Tipo);
            EstamentoPreparado.setInt(6, salario);
            EstamentoPreparado.setInt(7, Edad);
            EstamentoPreparado.setString(8, Sexo);
            EstamentoPreparado.setString(9, Pass);
            EstamentoPreparado.setString(10, Mail);
            EstamentoPreparado.setString(11, colonia);
            EstamentoPreparado.setInt(12, codigoPostal);
            EstamentoPreparado.setInt(13, NumExt);
            EstamentoPreparado.setInt(14, NumInt);
            EstamentoPreparado.setString(15, Calle);
            EstamentoPreparado.setString(16, delegacion);
            EstamentoPreparado.setInt(17, NivelAcceso);
            EstamentoPreparado.executeUpdate();
            Control.CerrarConexion();
            return "Usuario Registrado";
        } catch (SQLException error) {
            return "Error:" + error.toString();
        } catch (ClassNotFoundException e) {
            return "Error:" + e.getLocalizedMessage();

        }
    }

    //Agregar servicio del cliente
    public String AddService(String type, int IdUsuario, String FechaSol, int costo) throws ClassNotFoundException {
        if (ConsultarExUser(IdUsuario)) {
            try {
                Control.CrearConexion();
                Query = "call ProcedureAgregarServicio('" + type + " ', '" + FechaSol + "', " + costo + ", " + IdUsuario + ", 1, 2);";
                res = Control.SentenciaSQL(Query);
                return "Servicio Solicitado";
            } catch (ClassNotFoundException | SQLException e) {
                return e.getMessage();
            }

        } else {
            return "Error en la cuenta";
        }
    }

    public ArrayList<String> getEncabezadoCatalogo() {
        ArrayList<String> arreglito = new ArrayList<>();
        try {

            Control.CrearConexion();
            Query = "select *  from PageInfo_Catalogo order by Version desc limit 0,1;";
            res = Control.SentenciaSQL(Query);

            while (res.next()) {
                arreglito.add(res.getString(2));
                arreglito.add(res.getString(3));
            }
            Control.CerrarConexion();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
            arreglito.removeAll(arreglito);
            arreglito.add("Error: " + ex.getLocalizedMessage());
        }
        return arreglito;
    }

    public String setEncabezado(String Title, String subtitulo, int IDUsuario) {
        try {

            Control.CrearConexion();
            Query = "call AñadirHeader(?,?,?);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, Title);
            EstamentoPreparado.setString(2, subtitulo);
            EstamentoPreparado.setInt(3, IDUsuario);
            EstamentoPreparado.executeUpdate();
            Control.CerrarConexion();
            return "Header Actualizado";
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
            return ex.toString();
        }
    }

    //Obtener Servicios del usuario mediante su email
    public ListaServicios getLas50History() throws ClassNotFoundException, SQLException {
        ListaServicios ServicesList = new ListaServicios();
        try {

            Control.CrearConexion();

            Query = "call GetAll50Services();";
            res = Control.SentenciaSQL(Query);

            while (res.next()) {
                Direccion direc = new Direccion();
                Servicio service = new Servicio();

                direc.setIdUsuario(res.getInt(1));
                service.setNombre(res.getString(2));
                service.setCorreo(res.getString(3));
                service.setIdServicio(res.getInt(4));
                service.setDescripcionDeServicio(res.getString(5));
                service.setFechaSolicitud(res.getString(6));
                service.setFechaEntrega(res.getString(7));
                service.setCosto(res.getInt(8));
                direc.setDelegacion(res.getString(9));
                direc.setColonia(res.getString(10));
                direc.setCP(res.getInt(11));
                direc.setCalle(res.getString(12));
                direc.setNumeroExt(res.getInt(13));
                direc.setNumeroInt(res.getInt(14));
                service.setDir(direc);
                ServicesList.AñadirALista(service);
            }
            Control.CerrarConexion();
            return ServicesList;

        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return null;
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getLocalizedMessage());
            return null;
        }
    }

    //Obtener Servicios del usuario mediante su email
    public ListaServicios getHistory(String Mail) throws ClassNotFoundException, SQLException {
        ListaServicios ServicesList = new ListaServicios();
        try {

            Control.CrearConexion();

            Query = "call GetServices('" + Mail + "');";
            res = Control.SentenciaSQL(Query);

            while (res.next()) {
                Direccion direc = new Direccion();
                Servicio service = new Servicio();

                direc.setIdUsuario(res.getInt(1));
                service.setNombre(res.getString(2));
                service.setCorreo(res.getString(3));
                service.setIdServicio(res.getInt(4));
                service.setDescripcionDeServicio(res.getString(5));
                service.setFechaSolicitud(res.getString(6));
                service.setFechaEntrega(res.getString(7));
                service.setCosto(res.getInt(8));
                direc.setDelegacion(res.getString(9));
                direc.setColonia(res.getString(10));
                direc.setCP(res.getInt(11));
                direc.setCalle(res.getString(12));
                direc.setNumeroExt(res.getInt(13));
                direc.setNumeroInt(res.getInt(14));
                service.setDir(direc);
                ServicesList.AñadirALista(service);
            }
            Control.CerrarConexion();
            return ServicesList;

        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return null;
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getLocalizedMessage());
            return null;
        }
    }

    public int ContarClientes() {
        try {
            Control.CrearConexion();
            Query = "SELECT COUNT(*) FROM Clientes ";
            res = Control.SentenciaSQL(Query);
            if (res.next()) {
                return res.getInt(1);
            }
            Control.CerrarConexion();
            return 0;
        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return 0;
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getLocalizedMessage());
            return 0;
        }
    }

    public int ContarEmpleados() {
        try {
            Control.CrearConexion();
            Query = "SELECT COUNT(*) FROM Empleados ";
            res = Control.SentenciaSQL(Query);
            if (res.next()) {
                return res.getInt(1);
            }
            Control.CerrarConexion();
            return 0;
        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return 0;
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getLocalizedMessage());
            return 0;
        }
    }

    public int ContarProductoEnServicio(String Nombre) {
        try {
            Control.CrearConexion();
            Query = "call GetCountservice('" + Nombre + "');";
            res = Control.SentenciaSQL(Query);
            if (res.next()) {
                return res.getInt(1);

            }
            Control.CerrarConexion();
            return 0;

        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return 0;
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getLocalizedMessage());
            return 0;
        }
    }

    //Obtener Productos del usuario mediante su email
    public ListOfproducts getProductList() throws ClassNotFoundException, SQLException {
        ListOfproducts ListaDeProductos = new ListOfproducts();
        try {
            Control.CrearConexion();
            Query = "select * from productos";
            res = Control.SentenciaSQL(Query);
            while (res.next()) {
                Producto Product = new Producto(res.getInt(1), res.getString(2), res.getInt(3), res.getInt(4), res.getString(5));
                ListaDeProductos.AñadirALista(Product);
            }
            Control.CerrarConexion();
            return ListaDeProductos;

        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return null;
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getLocalizedMessage());
            return null;
        }
    }

    public Producto GetProducto(int IdProducto) throws ClassNotFoundException, SQLException {
        try {
            Control.CrearConexion();
            Query = "select * from productos where idProducto =" + IdProducto + ";";
            res = Control.SentenciaSQL(Query);
            Producto Product = new Producto();
            while (res.next()) {
                Product = new Producto(res.getInt(1), res.getString(2), res.getInt(3), res.getInt(4), res.getString(5));
            }
            Control.CerrarConexion();
            return Product;

        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return null;
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getLocalizedMessage());
            return null;
        }
    }

    //Eliminar Producto, consulta con su ID
    public String EliminarProducto(int ID) throws ClassNotFoundException, SQLException {
        try {
            Control.CrearConexion();
            Query = "call EliminarProducto(?);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setInt(1, ID);
            EstamentoPreparado.executeUpdate();
            Control.CerrarConexion();
            return "El producto has sido eliminado";

        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return "Error: " + error.toString();
        } catch (ClassNotFoundException error) {
            System.out.println("Error: " + error.getLocalizedMessage());
            return "Error: " + error.toString();
        }
    }

    //Agregar Producto
    public String AgregarProducto(String Nombre, int Costo, String Desc) throws ClassNotFoundException, SQLException {
        try {
            Control.CrearConexion();
            Query = "call AgregarProducto(?,?,?);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, Nombre);
            EstamentoPreparado.setInt(2, Costo);
            EstamentoPreparado.setString(3, Desc);
            EstamentoPreparado.executeUpdate();
            Control.CerrarConexion();
            return "El producto has sido agregado";

        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return "Error: " + error.toString();
        } catch (ClassNotFoundException error) {
            System.out.println("Error: " + error.getLocalizedMessage());
            return "Error: " + error.toString();
        }
    }

    //Modificar el Producto
    public String ModificarProducto(String Nombre, int Costo, String Desc, int IdProducto) throws ClassNotFoundException, SQLException {
        try {
            Control.CrearConexion();
            Query = "UPDATE Productos SET Nombre=?, Costo =?,  Descripcion=? WHERE IdProducto=?;";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, Nombre);
            EstamentoPreparado.setInt(2, Costo);
            EstamentoPreparado.setString(3, Desc);
            EstamentoPreparado.setInt(4, IdProducto);
            EstamentoPreparado.executeUpdate();
            Control.CerrarConexion();
            return "El producto ha sido editado";

        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return "Error: " + error.toString();
        } catch (ClassNotFoundException error) {
            System.out.println("Error: " + error.getLocalizedMessage());
            return "Error: " + error.toString();
        }
    }

}
