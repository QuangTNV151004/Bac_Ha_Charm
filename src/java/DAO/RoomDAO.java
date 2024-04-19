/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entities.Room;
import Entities.RoomTypes;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LENOVO
 */
public class RoomDAO extends DBContext {

    public ArrayList<Room> getListRoom() {
        try {
            ArrayList<Room> ListRoom = new ArrayList<>();
            String sql = "SELECT * FROM Rooms";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomid = rs.getInt(1);
                int roomtypeid = rs.getInt(2);
                String roomname = rs.getString(3);
                String status = rs.getString(4);
                Room r = new Room(roomid, roomtypeid, roomname, status);
                ListRoom.add(r);
            }
            return ListRoom;
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<RoomTypes> getListRoomTypes() {
        try {
            ArrayList<RoomTypes> ListRoomTypes = new ArrayList<>();
            String sql = "SELECT * FROM RoomTypes p\n";

            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomtypeid = rs.getInt(1);
                String description = rs.getString(2);
                int capacity = rs.getInt(3);
                double price = rs.getDouble(4);
                String roomtypename = rs.getString(5);
                String image = rs.getString(6);
                RoomTypes rt = new RoomTypes(roomtypeid, description, capacity, price, roomtypename, image);
                ListRoomTypes.add(rt);

            }
            return ListRoomTypes;
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void getListRoomTypes(String roomTypeName) {
        try {
            String sql = "select * from RoomTypes\n"
                    + "where RoomTypeName like ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, roomTypeName);
            ResultSet rs = statement.executeQuery();

            rs.getInt(1);
            rs.getString(2);
            rs.getInt(3);
            rs.getDouble(4);
            rs.getString(5);
            rs.getString(6);
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Room> getAvailableRooms(Date checkIn, Date checkOut) {
        ArrayList<Room> availableRooms = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Rooms r "
                    + "JOIN RoomTypes rt ON r.RoomTypeID = rt.RoomTypeID "
                    + "WHERE r.Status = 'available' AND r.RoomTypeID NOT IN ("
                    + "SELECT b.RoomTypeID FROM Bookings b WHERE "
                    + "(b.CheckInDate < ? AND b.CheckOutDate > ?) OR "
                    + "(b.CheckInDate < ? AND b.CheckOutDate >= ?) OR "
                    + "(b.CheckInDate <= ? AND b.CheckOutDate > ?))";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDate(1, new java.sql.Date(checkIn.getTime()));
            statement.setDate(2, new java.sql.Date(checkOut.getTime()));
            statement.setDate(3, new java.sql.Date(checkOut.getTime()));
            statement.setDate(4, new java.sql.Date(checkOut.getTime()));
            statement.setDate(5, new java.sql.Date(checkIn.getTime()));
            statement.setDate(6, new java.sql.Date(checkOut.getTime()));

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Room room = new Room(rs.getInt("RoomID"), rs.getInt("RoomTypeID"),
                        rs.getString("RoomName"), rs.getString("Status"));
                availableRooms.add(room);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return availableRooms;
    }

    public RoomTypes getRoomTypeById(int roomTypeId) {
        RoomTypes roomType = null;
        try {
            // SQL query to select a room type based on RoomTypeID
            String sql = "SELECT * FROM RoomTypes WHERE RoomTypeID = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, roomTypeId);
            ResultSet rs = statement.executeQuery();

            // Check if the result set has any rows
            if (rs.next()) {
                // Read the room type details from the result set
                String description = rs.getString("Description");
                int capacity = rs.getInt("Capacity");
                double price = rs.getDouble("Price");
                String roomTypeName = rs.getString("RoomTypeName");
                String image = rs.getString("Image");

                // Create a new RoomTypes object with the fetched details
                roomType = new RoomTypes(roomTypeId, description, capacity, price, roomTypeName, image);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roomType;
    }

    public ArrayList<RoomTypes> getAvailableRoomTypes(Date checkIn, Date checkOut, int guestCount) {
        ArrayList<RoomTypes> availableRoomTypes = new ArrayList<>();
        try {
            // The SQL query checks for room types with at least one room that is not booked and available
            String sql = "SELECT DISTINCT rt.* FROM RoomTypes rt "
                    + "JOIN Rooms r ON rt.RoomTypeID = r.RoomTypeID "
                    + "WHERE rt.Capacity >= ? AND r.Status = 'available' "
                    + "AND NOT EXISTS ("
                    + "SELECT 1 FROM Bookings b WHERE b.RoomTypeID = rt.RoomTypeID "
                    + "AND ((? <= b.CheckOutDate AND ? >= b.CheckInDate) "
                    + "OR (? < b.CheckOutDate AND ? > b.CheckInDate)))";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, guestCount);
            statement.setDate(2, new java.sql.Date(checkIn.getTime()));
            statement.setDate(3, new java.sql.Date(checkIn.getTime()));
            statement.setDate(4, new java.sql.Date(checkOut.getTime()));
            statement.setDate(5, new java.sql.Date(checkOut.getTime()));

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomTypeId = rs.getInt("RoomTypeID");
                String description = rs.getString("Description");
                int capacity = rs.getInt("Capacity");
                double price = rs.getDouble("Price");
                String roomTypeName = rs.getString("RoomTypeName");
                String image = rs.getString("Image");

                RoomTypes roomType = new RoomTypes(roomTypeId, description, capacity, price, roomTypeName, image);
                availableRoomTypes.add(roomType);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return availableRoomTypes;
    }

    public void updateRoomStatusByRoomTypeId(int roomTypeId, String newStatus) {
        try {
            String sql = "UPDATE Rooms SET Status = ? WHERE RoomTypeID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, newStatus);
            statement.setInt(2, roomTypeId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
