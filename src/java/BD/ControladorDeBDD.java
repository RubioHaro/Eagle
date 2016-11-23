/*
 * New Ligths
 * Services info Web
 * Rubio Haro 
 */
package BD;

import Activacion.Mail;
import Usuarios.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    private ResultSet res;
    private ResultsSetDB ResDB;
    private final ControladorDeConexion Control;
    private PreparedStatement EstamentoPreparado;

    public ControladorDeBDD() {
        Control = new ControladorDeConexion();
        ResDB = new ResultsSetDB();
    }

    public ResultsSetDB BuscarUsuario(String Mail) throws ClassNotFoundException {
        ResDB = null;
        ResDB = new ResultsSetDB();
        Query = "SELECT * FROM Usuarios WHERE mail = '" + Mail + "'; ";
        System.out.println("Query:" + Query);
        try {
            Control.CrearConexion();
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
                Control.CerrarConexion();
                System.out.println(user.getTipo());
                if (user.getTipo().equals("Colaborador")) {
                    Query = "SELECT NivelAcceso FROM Usuarios inner join Empleados on Empleados.Idusuario = Usuarios.Idusuario WHERE mail = \"" + Mail + " \"; ";
                    Control.CrearConexion();
                    res = Control.SentenciaSQL(Query);
                    Control.CerrarConexion();
                    user.setNivelAcceso(res.getInt(1));
                } else if (user.getTipo().equals("Cliente")) {
                    user.setNivelAcceso(0);
                }

                ResDB.setCondicion(Boolean.TRUE);
                ResDB.setEstaus("Usuario Obtenido");
                ResDB.setUser(user);
            } else {
                Control.CerrarConexion();
                ResDB.setCondicion(Boolean.FALSE);
                ResDB.setEstaus("Usuario No encontrado");
                ResDB.AgregarError();
            }
            res.close();
        } catch (SQLException ex) {
            ResDB.setCondicion(Boolean.FALSE);
            ResDB.setEstaus("DB error: " + ex.toString());
            ResDB.AgregarError();
            Logger.getLogger(ControladorDeBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ResDB;
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
                System.out.println("xxxx");
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
        ResDB = BuscarUsuario(Mail);
        if (ResDB.getErrores() != 0) {
            mensaje = ResDB.getEstaus();
        } else {
            Usuario Cliente;
            Cliente = ResDB.getUser();
            mensaje = ActualizarUsuario(Cliente.getNombre(), Cliente.getApellidop(), Cliente.getApellidom(), Cliente.getMail(), 1);            
        }
        return mensaje;
    }

    //ACTUALIZAR USUARIO
    public String ActualizarUsuario(String Nombre, String apellidoP, String apellidoM, String Mail, int Estatus) throws ClassNotFoundException, SQLException {
        try {

            Control.CrearConexion();
            Query = "UPDATE Usuarios SET Nombre = ?,  ApellidoP = ?,  ApellidoM = ?,  Estatus = ?  WHERE Mail = ?;";            
            EstamentoPreparado = Control.StatmentAction(Query);
            EstamentoPreparado.setString(1, Nombre);
            EstamentoPreparado.setString(2, apellidoP);
            EstamentoPreparado.setString(3, apellidoM);
            EstamentoPreparado.setInt(4, Estatus);
            EstamentoPreparado.setString(5, Mail);
            EstamentoPreparado.executeUpdate();
            EstamentoPreparado.close();
            Control.CerrarConexion();            
            return "Usuario Registrado";

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
}
