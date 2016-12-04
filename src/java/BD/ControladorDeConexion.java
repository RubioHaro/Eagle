/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Ruben
 */
public class ControladorDeConexion {

    BaseDeDatos BDD;

    private Statement Sentencia;
    private Connection Conexion;
    

    public ControladorDeConexion(BaseDeDatos BDD) {
        this.BDD = BDD;
    }

    public ControladorDeConexion() {
        this.BDD = new BaseDeDatos();
    }

    public void CrearConexion() throws ClassNotFoundException, SQLException {
        Class.forName(BDD.getDriverClassName());
        Conexion = DriverManager.getConnection(BDD.getURL(), BDD.getNombreUsuario(), BDD.getPassword());
    }

    //Cerrar la Conexion
    public void CerrarConexion() throws SQLException {
        Conexion.close();
    }

    //Metodos para ejecutar sentencias SQL
    public ResultSet SentenciaSQL(String consulta) throws SQLException {
        this.Sentencia = (Statement) Conexion.createStatement();
        return this.Sentencia.executeQuery(consulta);
    }
    
    public PreparedStatement StatmentAction(String consulta) throws SQLException {
        return Conexion.prepareStatement(consulta);
    }
}
