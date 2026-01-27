package dao;

import java.io.IOException;
// 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import dao.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        UserDAO dao = new UserDAO();
        if (dao.validate(email, pass)) {
            // نجاح الدخول: إنشاء الجلسة (Étape 7)
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);
            
            // التوجيه لصفحة العروض
            response.sendRedirect("offres"); 
        } else {
            // فشل الدخول: العودة لصفحة Login مع رسالة خطأ
            response.sendRedirect("login.jsp?error=true");
        }
    }
}