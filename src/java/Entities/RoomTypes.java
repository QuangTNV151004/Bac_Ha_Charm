/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

/**
 *
 * @author LENOVO
 */
public class RoomTypes {

    private int roomTypeId;
    private String description;
    private int capcity;
    private double price;
    private String roomTypeName;
    private String image;

    public RoomTypes() {
    }

    public RoomTypes(int roomTypeId, String description, int capcity, double price, String roomTypeName, String image) {
        this.roomTypeId = roomTypeId;
        this.description = description;
        this.capcity = capcity;
        this.price = price;
        this.roomTypeName = roomTypeName;
        this.image = image;
    }

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(int roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCapcity() {
        return capcity;
    }

    public void setCapcity(int capcity) {
        this.capcity = capcity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "RoomTypes{" + "roomTypeId=" + roomTypeId + ", description=" + description + ", capcity=" + capcity + ", price=" + price + ", roomTypeName=" + roomTypeName + ", image=" + image + '}';
    }

}
