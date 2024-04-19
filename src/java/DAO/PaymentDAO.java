package DAO;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * PaymentDAO class used for interacting with the Payments table in the
 * database.
 */
public class PaymentDAO extends DBContext {

    public boolean insertPayment(int bookingId, double amount, String bankCode) {
        boolean insertSuccess = false;
        try {
            // Note: The SQL query now includes hardcoded 'Banking Transfer' as the payment method
            // and GETDATE() for the current date and time on the database server.
            String sql = "INSERT INTO Payments (BookingID, Amount, PaymentMethod, PaymentDate) VALUES (?, ?, ?, GETDATE())";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, bookingId);
            statement.setDouble(2, amount);
            statement.setString(3, bankCode);
            int rowsInserted = statement.executeUpdate();
            insertSuccess = rowsInserted > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return insertSuccess;
    }

    // Additional methods and main method for testing can be included here.
}
