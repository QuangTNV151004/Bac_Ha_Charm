<%-- 
    Document   : Home
    Created on : Mar 3, 2024, 8:41:39 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bac Ha Charm Stay</title>
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" media="screen and (max-width: 850px)" href="styles/handset_index.css">
        <link rel="stylesheet" media="screen and (max-width: 650px)" href="styles/hamburger-menu.css">

    </head>


    <body>
        <!-- Navbar -->
        <div class="hamburger">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
        <div class="frontpage">

            <div class="navbar">

                <div id="logo1">

                    <img src="socials/logo.png" alt="">
                </div>
                <ul id="navbarmain">
                    <li>
                        <a href="Home.jsp">Home</a>
                    </li>
                    <li>
                        <a href="#about">About</a>
                    </li>
                    <li>
                        <a href="#kitchen">Kitchen</a>
                    </li>
                    <li>
                        <a href="#rooms">Rooms</a>
                    </li>
                    <li>
                        <a href="booking.jsp">Booking</a>
                    </li>
                    <li>
                        <a href="#contact">Contact Us</a>
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
                Explore the Majesty!
                <br>
                <div id="contentsum1">

                    Where a new adventure opens
                </div>

            </div>


        </div>

        <!-- Kitchen -->
        <div class="kitchen" id="kitchen">
            <div id="sum1">What would you like us to prepare for you?</div>
            <div id="intro">Our Kitchen</div>
            <div id="sum2">

                Taste the best of Town with the food that awaits you
            </div>

            <div class="foodbox">
                <div class="foodcolumn">

                    <div><img src="kitchen/food-3.jpg" alt="">
                        <div class="fooddesc">
                            Pig intestines
                        </div>
                    </div>
                    <div><img src="kitchen/food-4.jpg" alt="">
                        <div class="fooddesc">Salmon salad
                        </div>
                    </div>
                </div>
                <div class="foodcolumn">
                    <div><img src="kitchen/food-5.jpg" alt="">
                        <div class="fooddesc">
                            Horse hot pot
                        </div>
                    </div>
                    <div><img src="kitchen/food-6.jpg" alt="">
                        <div class="fooddesc">
                            Black chicken hotpot
                        </div>
                    </div>
                </div>
                <div class="foodcolumn">
                    <div><img src="kitchen/food-7.jpg" alt="">
                        <div class="fooddesc">
                            Salmon hotpot
                        </div>
                    </div>
                    <div><img src="kitchen/food-8.jpg" alt="">
                        <div class="fooddesc">
                            Rice and fried Eggplant
                        </div>
                    </div>
                </div>




            </div>
        </div>
        <div class="rooms" id="rooms">
            <div id="rsum1">How would you like to stay with us?</div>
            <div id="rintro">Our Rooms</div>
            <div id="rsum2">

                Life is peacefull!.
            </div>
            <div class="roomspic" id="r1"><img src="rooms/1.jpg" alt="">
                <div class="rdesc">
                    Deluxe Cottage
                    <br>
                    <div class="btn">
                        <a href="room.jsp" target="_blank"><button id="roombtn">More details</button></a>
                    </div>

                </div>
            </div>
            <div class="roomspic" id="r2"><img src="rooms/2.jpg" alt="">
                <div class="rdesc" id="rdesc1">
                    Traditional Private Bungalow

                    <div class="btn">
                        <a href="room.jsp" target="_blank"><button id="roombtn">More details</button></a>
                    </div>

                </div>
            </div>
            <div id="r3" class="roomspic"><img src="rooms/3.jpg" alt="">
                <div class="rdesc">
                    Romantic Private Bungalow
                    <div class="btn">
                        <a href="room.jsp" target="_blank"><button id="roombtn">More details</button></a>
                    </div>

                </div>
            </div>
        </div>
        <!-- About  -->
        <div class="about" id="about">
            <div id="asum1">Our brief history</div>
            <div id="aintro">About Us</div>
            <div id="asum2">

                Explore your destination with us. A great adventure begins here.
            </div>
            <div class="aboutpic" id="r3"><img src="img/about.jpg" alt="">
                <div class="adesc">
                    Located in Sa Pa, Eco Palms House - Mountain Retreat offers accommodations with free WiFi, a bar, restaurant, spa center and BBQ facilities.
                    <br><br> Guests can relax at the on-site bar. This property offers free private parking on site.
                    <div class="btn">
                        <a href="about.jsp" target="_blank"><button id="aboutbtn">Explore us</button></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact Us  -->
        <div class="contact" id="contact">
            <div id="csum1">We are available 24 X 7</div>
            <div id="cintro">Contact Us</div>
            <div id="csum2">

                Any questions or remarks? Let's start a conversation
            </div>
        </div>
        <div class="contdata" id="c3">
            <div id="form" >
                <form type="post" id="myform" action="#">
                    <div id="fname"><label for="name">Name :&nbsp; <input type="text" name="uname" id="name" placeholder="Enter Your Name" required></label></div>
                    <div id="fmail"><label for="email">Email :&nbsp;&nbsp; <input type="email" name="email" id="email" placeholder="Enter your email" required></label></div>
                    <div id="fphone"><label for="phone">Phone : <input type="number" name="uphone" id="phone" placeholder="Enter your Phone" required></label></div>
                    <div id="fissue"><label for="issue">Issue : &nbsp;&nbsp;&nbsp;<textarea name="uissue" id="issue" placeholder="Type your Issue here"></textarea></label></div>
                    <div id="submit" class="btn">
                        <button id="btnSubmit" type="submit" value="submit">Submit 
                        </button>
                    </div>
                </form>
            </div>
            <div class="cdesc">
                Our team is available. You can reach us using +0344338803 or you can mail us at bachacharmstay@gmail.com

            </div>

        </div>
        <footer>
            Copyright &copy; 2024 Bac Ha Charm Stay. All rights reserved.
        </footer>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="./js/app.js"></script>

        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="Booking_room"
        agent-id="20aef7be-d144-460f-9605-245660909809"
        language-code="vi"
        ></df-messenger>
</body>

</html>
