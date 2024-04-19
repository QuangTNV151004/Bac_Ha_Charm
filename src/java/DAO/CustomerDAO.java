/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entities.Customers;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CustomerDAO extends DBContext {

    public int insertCustomer(String fullName, String email, String phoneNumber) {
        int customerId = 0;
        try {
            String sql = "INSERT INTO Customers (FullName, Email, PhoneNumber) OUTPUT INSERTED.CustomerID VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullName);
            statement.setString(2, email);
            statement.setString(3, phoneNumber);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                customerId = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return customerId;
    }

    public int getLastCustomerID() {
        try {

            String sql = "SELECT TOP (1) [CustomerID]\n"
                    + "                    FROM [BacHaCharm].[dbo].[Customers]\n"
                    + "                     ORDER BY [CustomerID] DESC";
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
