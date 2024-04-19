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
        <title>Booking Rooms</title>
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="styles/room_style.css">
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
                Our Rooms!
                <br>
                <div id="contentsum1">

                    Peacefull stay
                </div>
            </div>
        </div>

        <!-- Room -->
        <div class="rooms" id="rooms">
            <div id="rsum2">
            </div>
            <div class="roomspic" id="r1"><img src="rooms/1.jpg" alt="">
                <div class="rdesc">
                    Brand new accommodation getting idea from old architecture concept of Ly Dynasty - an old era of Vietnamese history. As an accommodation that placed on the highest spot in Eco Palms House, Chalet House reaching the purest air level in Muong Hoa Valley. 
                    <br>
                    <br> 
                    Purifying every cell withing your body by enjoying a cup of Jasmine tea in early morning. Viewing the most unbroken view of Muong Hoa Valley. Sensing the Eastern Wind blowing through each of your pores. And that's what we call "Enjoy the Cottage Thing".
                    <br>
                    <div class="btn">
                        <a href="booking.jsp"><button>Book Now</button></a>
                    </div>   
                </div>

            </div>
            <div class="roomspic" id="r2"><img src="rooms/2.jpg" alt="">
                <div class="rdesc" id="rdesc1">
                    Decorated in pastel yellows, this charming country room creates a soothing ambience that is perfect for some R&R. As a yellow gem hiding in the green mountain cliff, our Traditional Private Bungalow carrying a rustic appearance. Designed with palm wood floor, bamboo ceiling, amber mud walling, and palm roofing. 
                    <br><br> 
                    The idea was taken from the old-fashioned H' mong architecture ( A pristine small tribe in Sapa, Vietnam) combined with vintage decoration art. A private balcony which provides an unbroken view of the whole Muong Hoa Valley, one of the most primitive and beautiful valleys in Southeast Asia.

                    <div class="btn">
                        <a href="booking.jsp"><button>Book Now</button></a>
                    </div>

                </div>
            </div>
            <div id="r3" class="roomspic"><img src="rooms/3.jpg" alt="">
                <div class="rdesc">
                    With contemporary Asian interior design, soft lighting and great attention to detail, the Romantic Private Bungalow creates just the right atmosphere for your next romantic break. Being a beautiful flower granted by Mother Nature, this eco bungalow is must-have choice in honeymoon for any couples. Featuring with a super-soft Queen bed, a warm-color bed net, and never miss scent from flowers that represent the sense of love           
                    <br><br> Designing the bathroom with romantic purpose, our bathtub is fit-up to 2 peoples, equipped with a crystal-clear window, and a light curtain to close-down when it needed. Everything is add-up to guarantee a most smooth and delightful night ever
                    <div class="btn">
                        <a href="booking.jsp"><button>Book Now</button></a>>
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
                    <div id="fmail"><label for="email">Email :&nbsp;&nbsp; <input type="text" name="umail" id="email" placeholder="Enter your email" required></label></div>
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
        <script src="app.js"></script>
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="Booking_room"
        agent-id="20aef7be-d144-460f-9605-245660909809"
        language-code="en"
        ></df-messenger>
</body>

</html>
