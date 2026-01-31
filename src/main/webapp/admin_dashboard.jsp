<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html dir="rtl" lang="ar">
<head>
    <meta charset="UTF-8">
    <title>لوحة تحكم الإدارة</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; margin: 20px; }
        .container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: center; }
        th { background-color: #3498db; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .status { font-weight: bold; color: #e67e22; }
        .logout { float: left; background: #e74c3c; color: white; padding: 8px 15px; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="container">
        <a href="logout" class="logout">تسجيل الخروج</a>
        <h2>لوحة تحكم الإدارة - متابعة الترشيحات</h2>
        
        <p>مرحباً أيها المدير: <strong><%= session.getAttribute("userEmail") %></strong></p>

        <table>
            <thead>
                <tr>
                    <th>رقم الطلب</th>
                    <th>إيميل الطالب</th>
                    <th>رقم العرض</th>
                    <th>الحالة</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        // 1. تحميل التعريف والاتصال بقاعدتك stages_db
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stages_db", "root", "");
                        
                        // 2. جلب البيانات من جدول candidatures
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM candidatures");

                        while(rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("id_etudiant") %></td>
                    <td><%= rs.getInt("id_offre") %></td>
                    <td class="status"><%= rs.getString("statut") %></td>
                </tr>
                <% 
                        }
                        conn.close();
                    } catch(Exception e) { 
                        out.println("خطأ في جلب البيانات: " + e.getMessage()); 
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>