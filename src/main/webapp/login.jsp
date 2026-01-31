<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="rtl" lang="ar">
<head>
    <meta charset="UTF-8">
    <title>تسجيل الدخول - إدارة التربصات</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1499750310107-5fef28a66643?auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, sans-serif;
        }
        .login-overlay {
            background: rgba(45, 52, 54, 0.95); 
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.5);
            width: 100%;
            max-width: 400px;
            text-align: center;
            color: white;
        }
        .form-control { margin-bottom: 20px; padding: 12px; border-radius: 8px; }
        .btn-login { background: #3498db; color: white; border: none; padding: 12px; width: 100%; border-radius: 8px; font-weight: bold; font-size: 18px; }
        .error-msg { color: #ff7675; margin-bottom: 15px; font-size: 14px; background: rgba(255,118,117,0.1); padding: 10px; border-radius: 5px; }
    </style>
</head>
<body>

<div class="login-overlay">
    <h2 class="mb-4">تسجيل الدخول</h2>

    <%-- عرض رسالة خطأ إذا فشل الدخول --%>
    <% if ("true".equals(request.getParameter("error"))) { %>
        <div class="error-msg">⚠️ خطأ في البريد الإلكتروني أو كلمة السر!</div>
    <% } else if ("database".equals(request.getParameter("error"))) { %>
        <div class="error-msg">❌ فشل الاتصال بقاعدة البيانات! (تأكدي من Laragon)</div>
    <% } %>
    
    <form action="login" method="post">
        <%-- تأكدي أن name="email" تطابق ما في السيرفلت --%>
        <input type="email" name="email" class="form-control" placeholder="البريد الإلكتروني" required>
        
        <%-- تأكدي أن name="password" تطابق ما في السيرفلت --%>
        <input type="password" name="password" class="form-control" placeholder="كلمة السر" required>
        
        <button type="submit" class="btn-login">دخول</button>
    </form>
</div>

</body>
</html>