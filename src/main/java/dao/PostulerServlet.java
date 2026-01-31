package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/postuler")
public class PostulerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. جلب رقم العرض من الرابط وإيميل الطالب من الـ Session
        String idOffre = request.getParameter("id");
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. الاتصال بالقاعدة وحفظ الترشيح
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stages_db", "root", "");
            
            // إضافة الترشيح بوضعية "En attente" (في الانتظار)
            String sql = "INSERT INTO candidatures (id_etudiant, id_offre, statut) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);//لحماية قاعدة بيانات من اختراق 
            ps.setString(1, userEmail); // هنا استعملنا الإيميل كمعرف للطالب
            ps.setString(2, idOffre);
            ps.setString(3, "En attente");
            
            ps.executeUpdate(); //ادخال بيانات لاشخاص لي سجلو 
            ps.close();
            conn.close();
            
            // الرجوع لصفحة العروض مع رسالة نجاح (اختياري)
            response.sendRedirect("offres"); 
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("خطأ في تقديم الطلب: " + e.getMessage());
        }
    }
}