package dao;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login") 
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // جلب البيانات من واجهة login.jsp
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        UserDAO dao = new UserDAO();
        
        try {
            // طلب الرتبة من الـ DAO
            String role = dao.getUserRole(email, pass);
            
            if (role != null) {
                // إنشاء الجلسة وتخزين البيانات
                HttpSession session = request.getSession();
                session.setAttribute("userEmail", email);
                session.setAttribute("userRole", role); 
                
                // التوجيه الذكي حسب الرتبة الموجودة في القاعدة
                if (role.equalsIgnoreCase("admin")) {
                    response.sendRedirect("admin_dashboard.jsp"); 
                } else {
                    response.sendRedirect("offres"); // يذهب لسيرفلت العروض
                }
            } else {
                // بيانات خاطئة
                response.sendRedirect("login.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=database");
        }
    }
}