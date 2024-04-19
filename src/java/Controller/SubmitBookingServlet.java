/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BookingDAO;
import DAO.CustomerDAO;
import DAO.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "SubmitBookingServlet", urlPatterns = {"/submitBooking"})
public class SubmitBookingServlet extends HttpServlet {

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
            out.println("<title>Servlet SubmitBookingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitBookingServlet at " + request.getContextPath() + "</h1>");
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

        boolean isValidInformation = true;
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String checkInDateStr = request.getParameter("checkInDate");
        String checkOutDateStr = request.getParameter("checkOutDate");
        int roomTypeID = Integer.parseInt(request.getParameter("roomTypeID"));
        int guestCount = Integer.parseInt(request.getParameter("guestCount"));

        // Regex patterns
        String namePattern = "^[\\p{L} .'-]+$";
        String emailPattern = "^[\\w-_.+]*[\\w-_.]@([\\w]+\\.)+[\\w]+[\\w]$";
        String phonePattern = "^[0-9]{9,12}$";

        // Validate fullName
        if (!fullName.matches(namePattern)) {
            isValidInformation = false; 
            request.setAttribute("errorMessage", "Invalid full name. Please use letters only.");
        }

        // Validate email
        if (!email.matches(emailPattern)) {
            isValidInformation = false;
            request.setAttribute("errorMessage", "Invalid email format. Please use a valid email.");
        }

        // Validate phone
        if (!phone.matches(phonePattern)) {
            isValidInformation = false; 
            request.setAttribute("errorMessage", "Invalid phone number. Please use digits only or ensure it has between 9 and 12 digits.");
        }

        if (isValidInformation) {
            BookingDAO bookingDAO = new BookingDAO();
            CustomerDAO customer = new CustomerDAO();
            RoomDAO room = new RoomDAO();
            
            int customerId = customer.insertCustomer(fullName, email, phone);
            if (customerId > 0) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.sql.Date checkInDate = null;
                java.sql.Date checkOutDate = null;

                try {

                    Date parsedCheckInDate = sdf.parse(checkInDateStr);
                    checkInDate = new java.sql.Date(parsedCheckInDate.getTime());

                    Date parsedCheckOutDate = sdf.parse(checkOutDateStr);
                    checkOutDate = new java.sql.Date(parsedCheckOutDate.getTime());

                } catch (ParseException e) {
                    request.setAttribute("errorMessage", "Invalid date format. Please use yyyy-mm-dd format.");
                    request.getRequestDispatcher("confirmBooking.jsp").forward(request, response);
                    return;
                }

                int bookingId = bookingDAO.createBooking(customerId, roomTypeID, checkInDate, checkOutDate, guestCount, "Booked");
                room.updateRoomStatusByRoomTypeId(roomTypeID, "Nonavalable");
                if (bookingId > 0) {
                    request.setAttribute("errorMessage", "Create booking record successfull.");
                } else {
                    request.setAttribute("errorMessage", "Cannot create booking record.");
                    request.getRequestDispatcher("confirmBooking.jsp").forward(request, response);
                }
            }
            response.sendRedirect("./vnpay_jsp/vnpay_pay.jsp");

        } else {
            request.getRequestDispatcher("confirmBooking.jsp").forward(request, response);
        }

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
