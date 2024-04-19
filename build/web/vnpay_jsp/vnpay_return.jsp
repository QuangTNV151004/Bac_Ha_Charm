<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="com.vnpay.common.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="DAO.BookingDAO"%>
<%@page import="DAO.PaymentDAO"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>KẾT QUẢ THANH TOÁN</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <style>
            body {
                background-color: #f4f4f4;
                font-family: Arial, sans-serif;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .header {
                text-align: center;
                margin-bottom: 30px;
            }
            .header h3 {
                margin: 0;
                color: #4CAF50;
            }
            .check-icon {
                font-size: 50px;
                color: #4CAF50;
            }
            .footer {
                text-align: center;
                padding-top: 20px;
                border-top: 1px solid #eee;
                margin-top: 20px;
            }
            .btn-custom {
                background-color: #4CAF50;
                color: #fff;
                border-radius: 20px;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                margin: 10px;
                text-decoration: none;
                display: inline-block;
            }
            .btn-custom:hover {
                background-color: #45a049;
            }
            .form-group label {
                font-weight: bold;
            }
            .text-muted {
                color: #6c757d!important;
            }
            .payment-failed {
                color: #ff4d4d; /* Màu đỏ để báo lỗi */
                font-weight: bold;
                background-color: #ffe5e5; /* Màu nền nhẹ cho thông báo lỗi */
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ff0000; /* Viền màu đỏ */
                margin-top: 15px;
                text-align: center;
            }
        </style>
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label><%=request.getParameter("vnp_Amount")%></label>
                </div>  
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã lỗi thanh toán:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div> 
                <div class="form-group">
                    <label >Tình trạng giao dịch:</label>
                    <label>
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                BookingDAO booking = new BookingDAO();
                                PaymentDAO payment = new PaymentDAO();
                                 String amountParam = request.getParameter("vnp_Amount");
                                   // Giả sử chúng ta cần phải chuyển đổi số tiền này sang định dạng chuẩn
                                 double amount = Double.parseDouble(amountParam) / 100;
                                 String bankCode = request.getParameter("vnp_BankCode");
                                payment.insertPayment(booking.getLastBookingID(), amount, bankCode);
                                    out.print("Thành công");
                                } else {
                                    out.print("Không thành công");
                                }

                            } else {
                                out.print("invalid signature");
                            }
                        %></label>
                </div> 
            </div>
            <p>
                &nbsp;
            </p>
            <%
                           if (signValue.equals(vnp_SecureHash)) {
                               if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
            %><div class="container">
                <div class="header">
                    <div class="check-icon">&#10004;</div>
                    <h3>Thanh toán thành công</h3>
                    <p>Vui lòng chụp lại biên lai để xác nhận kết quả hoặc sử dụng cho các quyền lợi tiếp theo.</p>
                </div>

                <a href="/Bac_Ha_Charm/Home.jsp"><button class="btn-custom">Quay lại</button></a>
                <footer class="footer">
                    <p>&copy; VNPAY 2024</p>
                </footer>
            </div><%
                                   out.print("Thành công");
                               } else {
            %><div class='payment-failed'>Không thành công</div>
            <a href="/Bac_Ha_Charm/Home.jsp"><button class="btn-custom">Quay lại</button></a><%
                               }

                           } else {
                               out.print("invalid signature");
                           }
            %>

        </div>  

    </body>
</html>
