/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var selectedRooms = [];

function formatDate(dateString) {
    var date = new Date(dateString);
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');

    return [year, month, day].join('-');
}


function selectRoom(roomTypeId, roomTypeName, price) {
    var guestCount = document.getElementById('guestCount').value;
    var checkInDate = formatDate(document.getElementById("checkInDate").value);
    var checkOutDate = formatDate(document.getElementById("checkOutDate").value);

    var room = {
        id: roomTypeId,
        name: roomTypeName,
        price: price,
        guests: guestCount,
        checkIn: checkInDate,
        checkOut: checkOutDate
    };
    selectedRooms.push(room);
    sessionStorage.setItem('selectedRooms', JSON.stringify(selectedRooms));
    sessionStorage.setItem('checkInDate', checkInDate);
    sessionStorage.setItem('checkOutDate', checkOutDate);
    updateSelectedRoomsDisplay();
}

function updateSelectedRoomsDisplay() {
    var displayArea = document.getElementById('selected-rooms');
    displayArea.innerHTML = ''; // Clear the current content
    var total = 0;
    var nights = calculateNights(); // Calculate the number of nights based on the check-in and check-out dates

    selectedRooms.forEach(function (room, index) {
        total += room.price * nights; // Assuming price is per night
        displayArea.innerHTML +=
                '<div class="room-item">' +
                'Room: ' + room.name + '<br>' +
                'Price per night: $' + room.price + '<br>' +
                'Guests: ' + room.guests + '<br>' +
                'Nights: ' + nights + '<br>' +
                '<button onclick="removeRoom(' + index + ')">Remove</button>' +
                '</div>';
    });

    displayArea.innerHTML += '<div class="total-price">Total: $' + total + '</div>';
    if (selectedRooms.length > 0) {
        displayArea.innerHTML += '<button onclick="confirmBooking()" class="book-now-btn">Book</button>';
    }
}

function calculateNights() {
    var checkInDate = new Date(document.getElementById("checkInDate").value);
    var checkOutDate = new Date(document.getElementById("checkOutDate").value);
    var timeDifference = checkOutDate.getTime() - checkInDate.getTime();
    var nights = timeDifference / (1000 * 3600 * 24); // Chuyển đổi từ milisecond sang số đêm
    return nights;
}

function removeRoom(index) {
    selectedRooms.splice(index, 1); // Xóa phòng kh?i m?ng theo index
    updateSelectedRoomsDisplay(); // C?p nh?t l?i hi?n th?
}

function confirmBooking() {
    var checkInDate = formatDate(document.getElementById("checkInDate").value);
    var checkOutDate = formatDate(document.getElementById("checkOutDate").value);
    var totalNights = calculateNights();
    var totalPrice = 0;

    selectedRooms.forEach(function (room) {
        totalPrice += room.price * totalNights;
    });

    sessionStorage.setItem('totalNights', totalNights);
    sessionStorage.setItem('totalPrice', totalPrice);
    sessionStorage.setItem('checkInDate', checkInDate);
    sessionStorage.setItem('checkOutDate', checkOutDate);
    sessionStorage.setItem('selectedRooms', JSON.stringify(selectedRooms));

    window.location.href = 'confirmBooking.jsp';
}


function bookNow(roomTypeId, roomTypeName, price) {
    var guestCount = document.getElementById('guestCount').value; // Lấy số lượng khách từ form
    var room = {
        id: roomTypeId,
        name: roomTypeName,
        price: price,
        guests: guestCount
    };
    selectedRooms = [room];
    sessionStorage.setItem('roomTypeID', roomTypeId.toString());
    sessionStorage.setItem('selectedRooms', JSON.stringify(selectedRooms));
    // Cập nhật hiển thị và chuyển hướng
    updateSelectedRoomsDisplay();
    confirmBooking();

}




window.onload = function () {
    var today = new Date().toISOString().split('T')[0];
    document.getElementById("checkInDate").setAttribute('min', today);
    document.getElementById("checkOutDate").setAttribute('min', today);

    // Khôi phục trạng thái selectedRooms từ sessionStorage khi trang được tải
    var storedRooms = sessionStorage.getItem('selectedRooms');
    if (storedRooms) {
        selectedRooms = JSON.parse(storedRooms);
        updateSelectedRoomsDisplay();
    }
}


