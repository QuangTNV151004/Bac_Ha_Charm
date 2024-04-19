/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.RoomDAO;
import Entities.Room;
import Entities.RoomTypes;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class BookingServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        RoomDAO db = new RoomDAO();
        ArrayList<Room> list_room = db.getListRoom();
        ArrayList<RoomTypes> list_roomtypes = db.getListRoomTypes();
        request.setAttribute("list_room", list_room);
        request.setAttribute("list_roomtypes", list_roomtypes);
        request.getRequestDispatcher("booking.jsp").forward(request, response);
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
        RoomDAO db = new RoomDAO();
        String checkInDateStr = request.getParameter("checkInDate");
        String checkOutDateStr = request.getParameter("checkOutDate");
        String guestCountStr = request.getParameter("guestCount");

        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            if (checkInDateStr.compareTo(checkOutDateStr) >= 0) {
                throw new Exception("Check-out date must be after check-in date.");
            }

            int guestCount = Integer.parseInt(guestCountStr);
            if (guestCount < 1) {
                throw new IllegalArgumentException("Number of guests cannot be less than 1.");
            }
            if (guestCount > 3) {
                throw new IllegalArgumentException("If you have a party size over 3 persons, please contact us for the best support.");
            }

            Date checkInDate = format.parse(checkInDateStr);
            Date checkOutDate = format.parse(checkOutDateStr);
            ArrayList<RoomTypes> availableRooms = db.getAvailableRoomTypes(checkInDate, checkOutDate, guestCount);

            request.setAttribute("availableRooms", availableRooms);
            request.setAttribute("checkInDate", checkInDateStr);
            request.setAttribute("checkOutDate", checkOutDateStr);
        } catch (ParseException e) {
            request.setAttribute("errorMessage", "Invalid date format.");
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", e.getMessage());
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Check-out date must be after check-in date.");
        }

        ArrayList<Room> list_room = db.getListRoom();
        ArrayList<RoomTypes> list_roomtypes = db.getListRoomTypes();
        request.setAttribute("list_room", list_room);
        request.setAttribute("list_roomtypes", list_roomtypes);

        // Forward only once after handling all possible exceptions and setting all required attributes
        request.getRequestDispatcher("booking.jsp").forward(request, response);
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
