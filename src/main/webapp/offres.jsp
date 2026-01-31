<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, models.Offre" %>

<%
    // حماية الجلسة
    if (session.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <title>بوابة التربصات - قائمة العروض</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f0f2f5; font-family: 'Segoe UI', Tahoma, sans-serif; text-align: right; }
        .navbar { background: linear-gradient(135deg, #2c3e50, #34495e) !important; }
        .table-container { background: white; padding: 40px; border-radius: 20px; box-shadow: 0 15px 35px rgba(0,0,0,0.08); margin-top: 40px; }
        th, td { text-align: right !important; padding: 18px !important; vertical-align: middle; }
        .badge-info { background-color: #e3f2fd; color: #0d47a1; border: 1px solid #bbdefb; padding: 8px 12px; border-radius: 8px; }
        .btn-postuler { background-color: #00b894; color: white; border-radius: 10px; padding: 8px 20px; text-decoration: none; transition: 0.3s; }
        .btn-postuler:hover { background-color: #00a087; color: white; transform: translateY(-2px); }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">بوابة التربصات</a>
            <div class="ms-auto d-flex align-items-center">
                <span class="text-white me-3">مرحباً بك، <b><%= session.getAttribute("userEmail") %></b></span>
                <a href="logout" class="btn btn-outline-light btn-sm px-3 rounded-pill">خروج</a>
            </div>
        </div>
    </nav>

    <div class="container mb-5">
        <div class="table-container">
            <h3 class="fw-bold mb-4">قائمة التربصات المتاحة</h3>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>رقم</th>
                            <th>العنوان</th>
                            <th>التخصص</th>
                            <th>المؤسسة</th>
                            <th class="text-center">الإجراء</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            // جلب البيانات من الـ Request
                            List<models.Offre> offres = (List<models.Offre>) request.getAttribute("listOffres");
                            
                            if (offres != null && !offres.isEmpty()) {  // باه مايجيش خطا ادا كانت قائمة فارغة 
                                for (models.Offre o : offres) { // باه كل عنصر في قلائمة تعطيه سطر خاص بيه   
                        %>
                        <tr>
                            <td class="text-secondary fw-bold"><%= o.getId() %></td>
                            <td class="fw-bold text-dark"><%= o.getTitre() %></td>
                            <td><span class="badge badge-info"><%= o.getEntreprise() %></span></td>
                            <td class="text-muted"><%= o.getDescription() %></td>
                            <td class="text-center">
                                <a href="postuler?id=<%= o.getId() %>" class="btn-postuler">مشاركة </a>
                            </td>
                        </tr>
                        <% 
                                } // غلق الـ for
                            } else { 
                        %>
                        <tr>
                            <td colspan="5" class="text-center py-5 text-secondary">لا توجد عروض متاحة حالياً.</td>
                        </tr>
                        <% 
                            } // غلق الـ if 
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>