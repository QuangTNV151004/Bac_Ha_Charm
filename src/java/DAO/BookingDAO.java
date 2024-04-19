/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BookingDAO extends DBContext {

    public int createBooking(int customerId, int roomTypeId, java.sql.Date checkInDate, java.sql.Date checkOutDate, int numberOfGuests, String status) {
        int bookingId = 0;
        try {
            String sql = "INSERT INTO Bookings (CustomerID, CheckInDate, CheckOutDate, NumberOfGuests, Status, RoomTypeID) OUTPUT INSERTED.BookingID VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, customerId);
            statement.setDate(2, checkInDate); 
            statement.setDate(3, checkOutDate);
            statement.setInt(4, numberOfGuests);
            statement.setString(5, status); 
            statement.setInt(6, roomTypeId);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                bookingId = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return bookingId;
    }

    public boolean updateBookingStatus(int bookingId, String newStatus) {
        boolean updateSuccess = false;
        try {
            String sql = "UPDATE Bookings SET Status = ? WHERE BookingID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, newStatus);
            statement.setInt(2, bookingId);

            int rowsUpdated = statement.executeUpdate();
            updateSuccess = rowsUpdated > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return updateSuccess;
    }

    public int getLastBookingID() {
        try {

            String sql = "SELECT TOP (1) [BookingID]\n"
                    + "                    FROM [BacHaCharm].[dbo].[Bookings]\n"
                    + "                     ORDER BY [BookingID] DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e + " -> CustomerDAO - getLastCommentID()");
        }
        return 0;
    }
}
