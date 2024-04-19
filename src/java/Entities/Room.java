/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

/**
 *
 * @author LENOVO
 */
public class Room {

    private int roomId;
    private int roomTypeId;
    private String roomName;
    private String status;

    public Room() {
    }

    public Room(int roomId, int roomTypeId, String roomName, String status) {
        this.roomId = roomId;
        this.roomTypeId = roomTypeId;
        this.roomName = roomName;
        this.status = status;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(int roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Room{" + "roomId=" + roomId + ", roomTypeId=" + roomTypeId + ", roomName=" + roomName + ", status=" + status + '}';
    }

}
