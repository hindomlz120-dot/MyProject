package web;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.OffreDAO;
import models.Offre;

@WebServlet("/offres") 
public class OffreServlet extends HttpServlet {
    private OffreDAO dao = new OffreDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Offre> listOffres = dao.getAllOffres();
        request.setAttribute("listOffres", listOffres);
        
        // توجيه لصفحة العرض
        request.getRequestDispatcher("/offres.jsp").forward(request, response);
    }
}