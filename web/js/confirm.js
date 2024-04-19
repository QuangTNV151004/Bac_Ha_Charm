/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function formatDateForDisplay(dateString) {
    var parts = dateString.split('-'); // Giả sử dateString là 'yyyy-mm-dd'
    return parts[2] + '-' + parts[1] + '-' + parts[0]; // Chuyển thành 'dd-mm-yyyy'
}
window.onload = function () {
    var selectedRooms = JSON.parse(sessionStorage.getItem('selectedRooms') || '[]');
    var checkInDate = sessionStorage.getItem('checkInDate');
    var checkOutDate = sessionStorage.getItem('checkOutDate');
    var totalNights = sessionStorage.getItem('totalNights');
    var totalPrice = sessionStorage.getItem('totalPrice');
    var displayArea = document.getElementById('selected-rooms-details');

    var formattedCheckInDate = formatDateForDisplay(checkInDate);
    var formattedCheckOutDate = formatDateForDisplay(checkOutDate);


    selectedRooms.forEach(function (room) {
        displayArea.innerHTML +=
                '<div class="room-detail">' +
                'Room Type ID: ' + room.id + '<br>' +
                'Room Name: ' + room.name + '<br>' +
                '<p class="room-attribute">Price per night: $' + room.price + '</p>' +
                '<p class="room-attribute">Guests: ' + room.guests + '</p>';

    });

    // Hiển thị tổng số đêm và tổng giá tiền
    displayArea.innerHTML += '<p class="room-attribute">Check-in Date:  <b style="color: blue"> ' + formattedCheckInDate + '</b></p>' +
            '<p class="room-attribute">Check-out Date:  <b style="color: blue"> ' + formattedCheckOutDate + '</b></p>' +
            '</div>';
    displayArea.innerHTML += '<h4>Total Nights: ' + totalNights + '</h4>';
    displayArea.innerHTML += '<div id="total-price">Total Price: $' + totalPrice + '</div>';
    document.getElementById('checkInDate').value = checkInDate;
    document.getElementById('checkOutDate').value = checkOutDate;

// Giả sử có nhiều phòng được chọn, lấy ID của phòng đầu tiên làm ví dụ
    if (selectedRooms.length > 0) {
        document.getElementById('roomTypeID').value = selectedRooms[0].id;
        document.getElementById('guestCount').value = selectedRooms[0].guests;
    }
};

function goBack() {
    // Quay trở lại trang trước đó
    window.history.back();
}

function clearSelections() {
    // Xóa dữ liệu đã lưu và chuyển hướng người dùng về trang booking
    sessionStorage.removeItem('selectedRooms');
    window.location.href = 'booking.jsp';
}







