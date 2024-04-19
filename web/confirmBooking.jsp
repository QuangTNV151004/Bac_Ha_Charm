<%-- 
    Document   : confirmBooking
    Created on : Mar 12, 2024, 8:19:37 PM
    Author     : LENOVO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Confirm Booking</title>
        <link rel="stylesheet" href="styles/confirm_booking.css">
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" media="screen and (max-width: 650px)" href="styles/hamburger-menu.css">

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
                Confirmation Booking
                <br>
                <div id="contentsum1">
                    Truthness is Happiness
                </div>
            </div>
        </div>
        <div class="container">
            <h1>Confirm Your Booking</h1>
            <div id="selected-rooms-details" class="selected-rooms-details"></div>
            <form action="submitBooking" method="post">
                <h2 style="color: red">${errorMessage}</h2>
                <input type="hidden" id="checkInDate" name="checkInDate">
                <input type="hidden" id="checkOutDate" name="checkOutDate">
                <input type="hidden" id="roomTypeID" name="roomTypeID">
                <input type="hidden" id="guestCount" name="guestCount">

                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="phone">Phone number:</label>
                <input type="text" id="phone" name="phone" required>

                <label for="specialRequests">Special Requests:</label>
                <textarea id="specialRequests" name="specialRequests"></textarea>

                <input id="submit" type="submit" value="Submit Booking">
            </form>
            <button onclick="goBack()" style="background-color: #f44336;" class="back-btn">Back</button>
            <button onclick="clearSelections()" style="background-color: #008CBA;" class="delete-option-btn">Delete option</button>
        </div>
        <script src="./js/confirm.js"></script>
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="Booking_room"
        agent-id="20aef7be-d144-460f-9605-245660909809"
        language-code="en"
        ></df-messenger>
</body>
</html>