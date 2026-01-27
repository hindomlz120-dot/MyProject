package dao;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout") // هادا هو الرابط اللي يروح له الزر
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. جلب الجلسة الحالية
        HttpSession session = request.getSession(false);
        
        // 2. إذا كاين جلسة، نمسحوها كامل (Invalidate)
        if (session != null) {
            session.invalidate();
        }
        
        // 3. نبعثو المستخدم لصفحة الدخول
        response.sendRedirect("login.jsp");
    }
}
