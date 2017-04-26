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
import WebChat.Message;
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
    private Empleado Collaborator;
    private Cliente client;
    private String Query;
    private Unidad Unit;
    private ResultSet res;
    private ResultsSetDB ResDB;
    private final ControladorDeConexion Control;
    private PreparedStatement EstamentoPreparado;
    String mensj;

    public ControladorDeBDD() {
        Control = new ControladorDeConexion();
        ResDB = new ResultsSetDB();
    }

    public ResultsSetDB BuscarUnidad(String Parametro, String Filtro) throws ClassNotFoundException {
        ResDB = null;
        ResDB = new ResultsSetDB();

        Query = "SELECT * FROM Unidades  WHERE Unidades." + Filtro + " = '" + Parametro + "'; ";
        try {
            Control.CrearConexion();
            res = Control.SentenciaSQL(Query);
            Unit = new Unidad();
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
        } catch (SQLException ex) {
            ResDB.setCondicion(Boolean.FALSE);
            ResDB.setEstaus("DB error: " + ex.toString());
            ResDB.AgregarError();
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ResDB;
    }

    public String RegistrarUnidad(String Matricula, String Marca, String Modelo, String Tipo, String Puertas, String Blindaje, String Antiguedad, String Status) throws ClassNotFoundException {
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

    public String EliminarUsuario(int ID) throws ClassNotFoundException, SQLException {
        try {
            Control.CrearConexion();
            Query = "call EliminarUsuario(?);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setInt(1, ID);
            EstamentoPreparado.executeUpdate();
            Control.CerrarConexion();
            return "El usuario a sido eliminado";

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

    public Empleado BuscarEmpleado(int IdUsuario) {
        try {
            ResDB = new ResultsSetDB();
            ResDB = BuscarUsuario(IdUsuario + "", "x", "x");
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

    public String ModificarContraseña(int idUsuario, String NuevaContraseña, String AntiguaContraseña) {
        ResDB = null;
        if (VerificarPassword(idUsuario, AntiguaContraseña)) {
            try {
                Control.CrearConexion();
                Query = "call ActualizarContraseña(?,?); ";
                EstamentoPreparado = Control.StatmentAction(Query);
                EstamentoPreparado.setInt(1, idUsuario);
                EstamentoPreparado.setString(2, NuevaContraseña);
                EstamentoPreparado.executeUpdate();
                EstamentoPreparado.close();
                Control.CerrarConexion();
                mensj = "El usuario ha sido actualizado";
            } catch (ClassNotFoundException | SQLException ex) {
                mensj = ex.toString();
                Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            mensj = "contraseña Incorrecta";
        }

        return mensj;
    }

    public String ModificarUsuario(String PasswordModificador, String IdUsuarioModificador, String IdUsuario, String Nombre, String apellidoP, String apellidoM, String Email) throws ClassNotFoundException {

        try {
            Control.CrearConexion();

            Query = "call ActualizarUsuario(?,?,?,?,?)";
            EstamentoPreparado = Control.StatmentAction(Query);
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

    public String ModificarUnidad(int IdUnidad, String Matricula, String Marca, String Modelo, String Tipo, String Puertas, String Blindaje, String Antiguedad, String Estatus) throws ClassNotFoundException {
        try {
            Control.CrearConexion();

            Query = "call ActualizarUnidad(?,?,?,?,?,?,?,?,?)";
            System.out.println("Query asodm");
            System.out.println(Query);
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setInt(1, IdUnidad);
            EstamentoPreparado.setString(2, Matricula);
            EstamentoPreparado.setString(3, Marca);
            EstamentoPreparado.setString(4, Modelo);
            EstamentoPreparado.setString(5, Tipo);
            EstamentoPreparado.setString(6, Puertas);
            EstamentoPreparado.setString(7, Blindaje);
            EstamentoPreparado.setString(8, Antiguedad.substring(0, 4));                                
            EstamentoPreparado.setString(9, Estatus);
            EstamentoPreparado.executeUpdate();
            EstamentoPreparado.close();
            Control.CerrarConexion();
            mensj = "La unidad ha sido actualizado";
        } catch (SQLException ex) {
            mensj = "Ha ocurrido un error:" + ex.toString();
        }
        return mensj;
    }

    public String RegistrarColaborador(String Nombre, String apellidoP, String apellidoM, String antiguedad, String posicion, int Salario, int Edad, String Sexo, String Pass, String Mail) throws ClassNotFoundException {

        try {
            Control.CrearConexion();
            Query = "call ProcedureGuardarEmpleado(?,?,?,?,?,?,?,?,?,?,null, null, null, null, null, null,1);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, Nombre);
            EstamentoPreparado.setString(2, apellidoP);
            EstamentoPreparado.setString(3, apellidoM);
            EstamentoPreparado.setString(4, antiguedad);
            EstamentoPreparado.setString(5, posicion);
            EstamentoPreparado.setInt(6, Salario);
            EstamentoPreparado.setInt(7, Edad);
            EstamentoPreparado.setString(8, Sexo);
            EstamentoPreparado.setString(9, Pass);
            EstamentoPreparado.setString(10, Mail);
            EstamentoPreparado.executeUpdate();
            EstamentoPreparado.close();
            Control.CerrarConexion();
            mensj = "El Colaborador a sido agregado a la nomina";
            Mail correo = new Mail();
            correo.mensajeAColaboradorRegistrado(Mail);
        } catch (SQLException ex) {
            mensj = "Ha ocurrido un error:" + ex.toString();
        }
        return mensj;
    }

    public String RegistrarCliente(String Nombre, String apellidoP, String apellidoM, String Empresa, String Pass, String Mail, String colonia, int codigoPostal, int NumExt, int NumInt, String Calle, String delegacion) throws ClassNotFoundException {

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

    public boolean VerificarPassword(int IdUsuario, String Pass) {
        ResDB = new ResultsSetDB();
        boolean c = false;
        try {
            Control.CrearConexion();
            Query = "call ValidarPassword(" + IdUsuario + ",\"" + Pass + "\");";
            res = Control.SentenciaSQL(Query);
            if (res.next()) {
                c = res.getInt(1) == 1; // retornara Numero 1 si es la contraseña correcta, Numero 0 si no lo es.
                res.close();
                Control.CerrarConexion();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ResDB.setEstaus("DB error: " + ex.toString());
            ResDB.AgregarError();
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return c;
    }

    //Para Iniciar sesion
    public ResultsSetDB IniciarSesion(String Mail, String Pass) {
        ResDB = null;
        ResDB = new ResultsSetDB();
        ResDB.setCondicion(Boolean.FALSE);
        ResDB.setEstaus("");
        if (VerificarPassword(GetIdUsuarioPorEmail(Mail), Pass)) {
            try {
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
                    } else {

                        if (user.getTipo().equals("Colaborador")) {
                            Control.CrearConexion();
                            Query = "call GetEmpleado(\"" + user.getMail() + "\"); ";
                            res = Control.SentenciaSQL(Query);
                            if (res.next()) {
                                Collaborator = new Empleado(user);
                                Collaborator.setAntiguedad(res.getString(2));
                                Collaborator.setTipo(res.getString(3));
                                Collaborator.setSalario(res.getInt(4));
                                Collaborator.setEdad(res.getInt(5));
                                Collaborator.setSexo(res.getString(6));
                                user.setNivelAcceso(res.getInt(7));
                                ResDB.setCollaborator(Collaborator);
                            }

                            Control.CerrarConexion();

                        } else if (user.getTipo().equals("Cliente")) {
                            Control.CrearConexion();
                            Query = "call GetClient(\"" + user.getMail() + "\"); ";
                            res = Control.SentenciaSQL(Query);
                            if (res.next()) {
                                client = new Cliente(user);
                                client.setCliente(res.getString(1));
                                client.setFechaRegistro(res.getString(2));
                                ResDB.setClient(client);
                                user.setNivelAcceso(0);
                            }

                            Control.CerrarConexion();

                        }
                        ResDB.setCondicion(Boolean.TRUE);
                        ResDB.setUser(user);
                    }
                    //Se cierra Aqeui para abrir una nueva conexion con otra sentencia
                    Control.CerrarConexion();
                    //Para definir el Nivel de Acceso
                } else {
                    ResDB.setEstaus("Usuario NO encontrado");
                    ResDB.AgregarError();
                    Control.CerrarConexion();
                }

            } catch (ClassNotFoundException | SQLException ex) {
                ResDB.setEstaus("DB error: " + ex.toString());
                ResDB.AgregarError();
                Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            ResDB.setEstaus("Datos Invalidos, porfavor verificalos y vuelve a intentar.");
            ResDB.AgregarError();
        }

        return ResDB;
    }

    public String ActivarUsuario(String Mail) throws ClassNotFoundException, SQLException {
        String mensaje;
        ResDB = null;
        ResDB = BuscarUsuario(Mail, "Mail", "Cliente");
        if (ResDB.getErrores() != 0) {
            mensaje = ResDB.getEstaus();
        } else {
            Usuario Cliente;
            Cliente = ResDB.getUser();
            try {

                Control.CrearConexion();
                Query = "call ActivarCliente(?);";
                EstamentoPreparado = Control.StatmentAction(Query);
                EstamentoPreparado.setInt(1, Cliente.getIdusuario());
                EstamentoPreparado.executeUpdate();
                EstamentoPreparado.close();
                Control.CerrarConexion();
                mensaje = "Usuario Actualizado";

            } catch (SQLException error) {
                mensaje = "Error:" + error.toString();
            } catch (ClassNotFoundException e) {
                mensaje = "Error:" + e.getLocalizedMessage();

            }
        }
        return mensaje;
    }

    public String EnviarPassByEmail(String Mail) {
        try {
            ResDB = null;
            int IdUsuario = GetIdUsuarioPorEmail(Mail);
            Control.CrearConexion();
            Query = "call GetPassword(" + IdUsuario + ");";
            res = Control.SentenciaSQL(Query);
            if (res.next()) {
                mensj = "Email enviado, reisa tu correo electronico";
                Mail Correo = new Mail();
                Correo.mensajeConPass(Mail, res.getString(1));
            } else {
                mensj = "No se ha podido encontrar el usuario";
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
            mensj = "Ha ocurrido un error al proceder solicitud: " + ex.toString();
        }
        return mensj;
    }

    //INSERTAR USUARIO
    public String AgregarEmpleado(String Nombre, String apellidoP, String apellidoM, String Antiguedad, String Tipo, String salario, String Edad, String Sexo, String Pass, String Mail) throws ClassNotFoundException, SQLException {

        try {
            Control.CrearConexion();
            Query = "call ProcedureGuardarEmpleado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, Nombre);
            EstamentoPreparado.setString(2, apellidoP);
            EstamentoPreparado.setString(3, apellidoM);
            EstamentoPreparado.setString(4, Antiguedad);
            EstamentoPreparado.setString(5, Tipo);
            EstamentoPreparado.setString(6, salario);
            EstamentoPreparado.setString(7, Edad);
            EstamentoPreparado.setString(8, Sexo);
            EstamentoPreparado.setString(9, Pass);
            EstamentoPreparado.setString(10, Mail);
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
                service.setEstatus(res.getString(15));
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

    public int ContarColaboradores(String Genero) {
        try {
            Control.CrearConexion();
            Query = "call ContarColaboradores" + Genero;
            res = Control.SentenciaSQL(Query);
            int i;
            if (res.next()) {
                i = res.getInt(1);
            } else {
                i = 0;
            }
            Control.CerrarConexion();
            return i;
        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return 0;
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getLocalizedMessage());
            return 0;
        }
    }

    public int ContarDiferentesEdades() {
        try {
            Control.CrearConexion();
            Query = "call CountAges";
            res = Control.SentenciaSQL(Query);
            int i;
            if (res.next()) {
                i = res.getInt(1);
            } else {
                i = 0;
            }
            Control.CerrarConexion();
            return i;
        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return 0;
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getLocalizedMessage());
            return 0;
        }
    }

    public int[] GetAges() {
        try {

            int Edades[] = new int[ContarDiferentesEdades()];
            int i = 0;
            Control.CrearConexion();
            Query = "call GetAges";
            res = Control.SentenciaSQL(Query);
            while (res.next()) {
                Edades[i] = res.getInt(1);
                i++;
            }
            Control.CerrarConexion();
            return Edades;
        } catch (SQLException error) {
            System.out.println("Error: " + error.toString());
            return null;
        } catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getLocalizedMessage());
            return null;
        }
    }

    public int GetIdUsuarioPorEmail(String Email) {
        int IdUsuario = 0;
        try {
            Control.CrearConexion();
            Query = "call GetIdByEmail(\"" + Email + "\");";
            res = Control.SentenciaSQL(Query);
            if (res.next()) {
                IdUsuario = res.getInt(1);
            }
            Control.CerrarConexion();
        } catch (SQLException | ClassNotFoundException error) {
            System.out.println("Crasheo: " + error.toString());
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, error);
        }
        return IdUsuario;
    }

    public int ContarColaboradoresPorEdad(int Edad) {
        try {
            Control.CrearConexion();
            Query = "call CountColEdad('" + Edad + "');";
            res = Control.SentenciaSQL(Query);
            int i;
            if (res.next()) {
                i = res.getInt(1);
            } else {
                i = 0;
            }
            Control.CerrarConexion();
            return i;
        } catch (SQLException | ClassNotFoundException error) {
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

    public int EnviarMensajeAGrupo(Message mensaje) {
        try {
            Control.CrearConexion();
            Query = "insert into dldb.mensajesforo(Mensaje,IdUsuario,IdForo) values(?,?,?)";
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, mensaje.getMensaje());
            EstamentoPreparado.setInt(2, mensaje.getIdUsuario());
            EstamentoPreparado.setInt(3, mensaje.getIdTeam());
            EstamentoPreparado.setInt(4, mensaje.getIdDestinatarioUsuario());
            EstamentoPreparado.setString(5, "Enviado");
            EstamentoPreparado.executeUpdate();
            Control.CerrarConexion();
            return 1;

        } catch (SQLException | ClassNotFoundException error) {
            return 0;
        }
    }

    public ResultsSetDB DesplegarMensajes(int IdEquipo) {
        try {
            Control.CrearConexion();
            ResDB = null;
            ResDB = new ResultsSetDB();
            Query = "select * from dldb.mensajesforo WHERE IdForo=" + IdEquipo;
            res = Control.SentenciaSQL(Query);
            ArrayList<Message> ListaMensajes = new ArrayList();
            while (res.next()) {
                Message Mensaje = new Message();
                Mensaje.setIdmensaje(res.getInt(1));
                Mensaje.setMensaje(res.getString(2));
                Mensaje.setIdUsuario(res.getInt(3));
                Mensaje.setIdTeam(res.getInt(4));
                ListaMensajes.add(Mensaje);
            }
            ResDB.setCondicion(Boolean.TRUE);
            ResDB.setEstaus("Mensajes Obtenidos");
            ResDB.setMessages(ListaMensajes);

            Control.CerrarConexion();
            res.close();
        } catch (SQLException | ClassNotFoundException ex) {
            ResDB.setCondicion(Boolean.FALSE);
            ResDB.setEstaus("DB error: " + ex.toString());
            ResDB.AgregarError();
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ResDB;
    }
}
