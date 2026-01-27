package dao;
import java.sql.*;

public class UserDAO {
    String url = "jdbc:mysql://localhost:3306/stages_db";
    String user = "root";
    String password = "";

    public boolean validate(String email, String pass) {
        boolean status = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            
            // التصحيح هنا: نتحقق من كلمة السر فقط لكي نسمح لأي إيميل بالدخول
            // التعديل: حذف "email=?" من الاستعلام
            String sql = "SELECT * FROM utilisateurs WHERE password=?"; 
            PreparedStatement ps = conn.prepareStatement(sql);
            
            // نمرر كلمة السر فقط (الموحدة التي تملكها الإدارة)
            ps.setString(1, pass); 
            
            ResultSet rs = ps.executeQuery();
            status = rs.next(); // إذا كانت كلمة السر موجودة في الجدول، يرجع true
            conn.close();
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return status;
    }
}
