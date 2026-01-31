package web; 

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import dao.OffreDAO;
import models.Offre;

@WebServlet("/offres") // هذا هو المسار الذي ينادي عليه LoginServlet
public class OffreServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            OffreDAO dao = new OffreDAO();
            // جلب القائمة من قاعدة البيانات
            List<Offre> list = dao.getAllOffres(); 
            
            // وضع القائمة في الـ Request لكي تقرأها صفحة JSP
            request.setAttribute("listOffres", list);
            
            // فتح صفحة offres.jsp وتمرير البيانات لها
            request.getRequestDispatcher("offres.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            // في حالة خطأ في القاعدة، نرسل رسالة خطأ للمتصفح
            response.getWriter().println("خطأ في جلب العروض: " + e.getMessage());
        }
    }
}