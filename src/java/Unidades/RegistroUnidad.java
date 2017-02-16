/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Unidades;

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
 * @author chavo
 */
public class RegistroUnidad extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion = request.getSession();
            String Matricula = request.getParameter("Matricula");
            String Marca = request.getParameter("Marca");
            String Modelo = request.getParameter("Modelo");
            String Tipo = request.getParameter("Tipo");
            String Puertas = request.getParameter("Puertas");
            String Blindaje = request.getParameter("Blindaje");
            String Antiguedad = request.getParameter("Antiguedad");
            String Status = request.getParameter("Status");

            ///Aqui debe estar la validacion
            if (1 == 1) {
                ControladorDeBDD unidades = new ControladorDeBDD();
                String res = null;
                try {
                    res = unidades.RegistrarUnidad(Matricula, Marca, Modelo, Tipo, Puertas, Blindaje, Antiguedad, Status);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
                }
                sesion.setAttribute("Error", 1);
                sesion.setAttribute("DescripcionError", res);
                response.sendRedirect("/Empleados/Unidades/Registrar.jsp");
            }
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
