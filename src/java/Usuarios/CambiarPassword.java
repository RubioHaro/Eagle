/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuarios;

import BD.ControladorDeBDD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CECyT9
 */
public class CambiarPassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            Usuario user = (Usuario) sesion.getAttribute("Usuario");
            int IdUsuario = user.getIdusuario();
            String PasswordAnt = request.getParameter("Password3");
            String Message;
            String NuevaPassword = request.getParameter("Password1");
            ControladorDeBDD control = new ControladorDeBDD();
            Message = control.ModificarContraseña(IdUsuario, NuevaPassword, PasswordAnt);
            sesion.setAttribute("Error", 1);
            sesion.setAttribute("DescripcionError", Message);
            String location = "/Empleados/Admin/AdminIndex.jsp";
            response.sendRedirect(location);
        } catch (Error e) {
            sesion.setAttribute("Error", 1);
            sesion.setAttribute("DescripcionError", e.getLocalizedMessage());
            String location = "/Empleados/Admin/AdminIndex.jsp";
            response.sendRedirect(location);
            System.out.println(e.getLocalizedMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
