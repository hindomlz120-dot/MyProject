package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.Offre; 

public class OffreDAO {
    // 1. الاتصال بقاعدة البيانات stages_db
    String url = "jdbc:mysql://localhost:3306/stages_db";
    String user = "root"; 
    String password = ""; 

    public List<Offre> getAllOffres() {
        List<Offre> offres = new ArrayList<>();
        try {
            // 2. تحميل الدرايفر
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 3. فتح الاتصال
            Connection conn = DriverManager.getConnection(url, user, password);
            
            // 4. كتابة الطلب (Query)
            String sql = "SELECT * FROM offres";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // 5. تحويل النتائج (أضفنا سطر الوصف هنا)
            while (rs.next()) {
                Offre o = new Offre();
                o.setId(rs.getInt("id"));
                o.setTitre(rs.getString("titre"));
                
                // جلب الوصف من عمود description في قاعدة البيانات
                o.setDescription(rs.getString("description")); 
                
                // جلب المجال من عمود domaine (اللي سميناه Entreprise في الـ JSP)
                o.setEntreprise(rs.getString("domaine")); 
                
                offres.add(o);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return offres;
    }
}