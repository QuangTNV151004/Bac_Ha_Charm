<%-- 
    Document   : booking
    Created on : Mar 9, 2024, 4:41:47 PM
    Author     : LENOVO
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entities.Room, Entities.RoomTypes" %>
<%@ page import="DAO.RoomDAO" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="styles/booking.css">
        <link rel="stylesheet" media="screen and (max-width: 650px)" href="styles/hamburger-menu.css">
        <title>Booking</title>
        <style>
            .booking-form label {
                display: block;
                margin-bottom: 5px;
            }

            .booking-form input[type="date"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .booking-form .submit-btn {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .booking-form .submit-btn:hover {
                background-color: #45a049;
            }

            .available-rooms h2 {
                margin-top: 20px;
            }

            .available-rooms ul {
                list-style-type: none;
                padding: 0;
            }

            .available-rooms li {
                margin-bottom: 5px;
            }

            .error-message {
                color: red;
            }
            /* Enhancements for the booking form */
            .booking-form {
                padding: 20px;
                background-color: #f8f9fa; /* Light background */
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Adding some shadow */
                margin-bottom: 20px; /* Space before the room list */
            }

            .booking-form input[type="date"] {
                border: 2px solid #ddd; /* Thicker border with lighter color */
                border-radius: 4px;
                padding: 10px; /* More padding for input */
            }

            .booking-form .submit-btn {
                width: 100%; /* Make the button full-width */
                font-size: 18px; /* Larger font size */
                padding: 12px; /* More padding for better touch */
            }

            /* Hover effects for buttons */
            .booking-form .submit-btn:hover,
            .select-room-btn:hover,
            .book-now-btn:hover {
                filter: brightness(90%); /* Slightly darker on hover */
            }
            .book-now-container {
                margin-top: 20px;
                text-align: center;
            }

            .book-now-btn {
                padding: 12px 25px;
                background-color: #008CBA; /* Choose your color */
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                text-transform: uppercase;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: background-color 0.3s ease;
            }

            .book-now-btn:hover {
                background-color: #005f73; /* Darker shade for hover state */
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <div class="hamburger">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
        <div class="frontpage_room">

            <div class="navbar">

                <div id="logo1">

                    <img src="socials/logo.png" alt="">
                </div>
                <ul id="navbarmain">
                    <li>
                        <a href="Home.jsp">Home</a>
                    </li>
                    <li>
                        <a href="Home.jsp#about">About</a>
                    </li>
                    <li>
                        <a href="Home.jsp#kitchen">Kitchen</a>
                    </li>
                    <li>
                        <a href="Home.jsp#rooms">Rooms</a>
                    </li>
                    <li>
                        <a href="room.jsp">Booking</a>
                    </li>
                    <li>
                        <a href="Home.jsp#contact">Contact Us</a>
                    </li>
                </ul>


                <div class="social">

                    <ul>
                        <li>
                            <a href="https://www.facebook.com/bachacharmstay?locale=vi_VN" target="_blank">

                                <img src="socials/fb.png" alt="" id="fb">
                            </a>


                        </li>
                        <li>
                            <a href="https://www.instagram.com/bachacharmstay/" target="_blank">


                                <img src="socials/ig.png" alt="" id="ig">
                            </a>
                        </li>
                        <li>
                            <a href="https://github.com/QuangTNV151004" target="_blank">

                                <img src="socials/git.png" alt="" id="git">
                            </a>
                        </li>
                    </ul>

                </div>           
            </div>



            <!-- Frontpage -->
            <div class="content">
                Booking Rooms
                <br>
                <div id="contentsum1">

                    Your choice is our pleasure
                </div>
            </div>
        </div>

        <form action="booking" method="post" class="booking-form">
            <label for="checkInDate">Check-in date:</label>
            <input type="date" id="checkInDate" name="checkInDate" required
                   value="<%= request.getParameter("checkInDate") != null ? request.getParameter("checkInDate") : "" %>"><br>

            <label for="checkOutDate">Check-out date:</label>
            <input type="date" id="checkOutDate" name="checkOutDate" required
                   value="<%= request.getParameter("checkOutDate") != null ? request.getParameter("checkOutDate") : "" %>"><br>

            <label for="guestCount">Number of guests:</label>
            <input type="number" id="guestCount" name="guestCount" required min="1"
                   value="<%= request.getParameter("guestCount") != null ? request.getParameter("guestCount") : "1" %>"><br>

            <input type="submit" value="Check Availability" class="submit-btn">
        </form>
        <!--Error message-->
        <% if (request.getAttribute("errorMessage") != null) { %>
        <p  class="error-message"><%= request.getAttribute("errorMessage") %></p>
        <% } %>


        <div class="room-booking-container">
            <div class="room-selection">
                <% if (request.getAttribute("availableRooms") != null) { %>
                <div class="available-rooms ">
                    <h2>Available Room Types:</h2>
                    <ul>
                        <% ArrayList<RoomTypes> availableRooms = (ArrayList<RoomTypes>) request.getAttribute("availableRooms"); %>
                        <% for (RoomTypes roomType : availableRooms) { %>
                        <li>
                            <!-- Hi?n th? hình ?nh và giá phòng --> 
                            <div class="room-details">
                                <div class="room-image">
                                    <img src="<%= roomType.getImage() %>" alt="Room Image">
                                </div>
                                <div class="room-description">
                                    <h3 style="display: none"><%= roomType.getRoomTypeId() %></h3>
                                    <h3><%= roomType.getRoomTypeName() %></h3>
                                    <p>Description: <%= roomType.getDescription() %></p>

                                    <a href="#" class="more-info-link">More info</a>
                                </div>
                                <div class="price-discount">
                                    <span class="offer-price">Price: <%= roomType.getPrice() %>$</span>
                                </div>
                                <div class="booking-buttons">
                                    <button type="button" onclick="selectRoom(<%= roomType.getRoomTypeId() %>, '<%= roomType.getRoomTypeName() %>', <%= roomType.getPrice() %>)" class="select-room-btn">Select</button>
                                    <button class="book-now-btn" onclick="bookNow(<%= roomType.getRoomTypeId() %>, '<%= roomType.getRoomTypeName() %>', <%= roomType.getPrice() %>)">Book Now</button>

                                </div>
                            </div>
                        </li>
                        <% } %>
                    </ul>
                    <% } %>
                </div>
            </div>
        </div>

      
        <div class="selected" >
            <h2>Your selection rooms:</h2>
            <p id="selected-rooms"></p>
        </div>

        <script src="./js/booking.js"></script>

        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="Booking_room"
        agent-id="20aef7be-d144-460f-9605-245660909809"
        language-code="en"
        ></df-messenger>
</body>
</html>
