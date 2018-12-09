/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tarun Naidu
 */
@WebServlet(name = "InsertValuesServlet", urlPatterns = {"/InsertValuesServlet"})
public class InsertValuesServlet extends HttpServlet {

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
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?useSSL=false","root","root")){
                String insertItem = "insert into item values(?,?)";
                String insertPrice = "Insert into price values(?,?)";
                String insertStock = "Insert into stock(itemid,quantity) values(?,?)";
                String insertSupplier = "Insert into supplier values(?,?,?)";
                String itemid = request.getParameter("ItemID");
                int itemprice = Integer.parseInt(request.getParameter("ItemPrice"));
                String Suppliername = request.getParameter("SupplierName");
                String supplierContact=request.getParameter("SupplierContact");
                String itemName = request.getParameter("ItemName");
                int quantity = Integer.parseInt(request.getParameter("Quantity"));
                System.out.println(itemid+" "+itemprice+" "+Suppliername+" "+supplierContact+" "+quantity+" "+itemName);
                PreparedStatement zero = con.prepareStatement(insertItem);
                zero.setString(1, itemid);
                zero.setString(2, itemName);
                zero.execute();
                PreparedStatement first = con.prepareStatement(insertPrice);
                first.setString(1, itemid);
                first.setInt(2, itemprice);
                first.execute();
                PreparedStatement second = con.prepareStatement(insertSupplier);
                second.setString(1,itemid);
                second.setString(2,Suppliername);
                second.setString(3,supplierContact);
                second.execute();
                PreparedStatement third = con.prepareStatement(insertStock);
                third.setString(1, itemid);
                third.setInt(2,quantity);
                third.execute();
                System.out.println("Done anna");
                response.sendRedirect("copySecond.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(InsertValuesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InsertValuesServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(InsertValuesServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(InsertValuesServlet.class.getName()).log(Level.SEVERE, null, ex);
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
