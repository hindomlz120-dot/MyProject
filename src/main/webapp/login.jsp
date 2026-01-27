<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>تسجيل الدخول - إدارة التربصات</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            /* خلفية المكتب والكمبيوتر اللي تشبه صورتك الأولى */
            background: url('https://images.unsplash.com/photo-1499750310107-5fef28a66643?auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-overlay {
            /* المربع الغامق والشفاف الأنيق */
            background: rgba(45, 52, 54, 0.9); 
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.6);
            width: 100%;
            max-width: 420px;
            text-align: center;
            color: white;
        }
        .form-control {
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 25px;
            border: none;
            background: rgba(255, 255, 255, 1);
            font-size: 16px;
        }
        .btn-login {
            background: #3498db;
            border: none;
            color: white;
            padding: 14px;
            border-radius: 5px;
            width: 100%;
            font-weight: bold;
            font-size: 20px;
            transition: 0.3s;
        }
        .btn-login:hover { 
            background: #2980b9;
            transform: scale(1.02);
        }
        h2 {
            font-weight: 700;
            margin-bottom: 40px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
    </style>
</head>
<body>

<div class="login-overlay">
    <h2>تسجيل الدخول</h2>
    
    <form action="login" method="post">
        <input type="email" name="email" class="form-control" placeholder="البريد الإلكتروني" required>
        <input type="password" name="password" class="form-control" placeholder="كلمة السر" required>
        <button type="submit" class="btn-login">دخول</button>
    </form>
</div>

</body>
</html>