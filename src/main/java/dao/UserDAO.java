
package dao; // السطر الأول لضمان توافق الملف مع مجلد dao في Eclipse

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private String url = "jdbc:mysql://localhost:3306/stages_db";
    private String user = "root";
    private String password = "";

    // الكود الموحد الذي تمنحه الإدارة للتلاميذ (تقدري تغيريه كما تحبين)
    private String STUDENT_PASSWORD_MASTER = "1234";

    public String getUserRole(String email, String pass) {
        String role = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            
            // أولاً: نتحقق هل المستخدم هو الإدارة (موجود في قاعدة البيانات)
            String sqlAdmin = "SELECT role FROM utilisateurs WHERE email=? AND password=? AND role='admin'"; 
            PreparedStatement psAdmin = conn.prepareStatement(sqlAdmin);
            psAdmin.setString(1, email);
            psAdmin.setString(2, pass); 
            
            ResultSet rsAdmin = psAdmin.executeQuery();
            if (rsAdmin.next()) {
                role = "admin"; // إذا وجدناه في القاعدة، فهو أدمن
            } else {
                // ثانياً: إذا لم يكن أدمن، نتحقق فقط من كلمة السر الموحدة للتلاميذ
                if (pass.equals(STUDENT_PASSWORD_MASTER)) {
                    role = "etudiant"; // نعتبره تلميذاً ونسمح له بالدخول بأي إيميل
                }
            }
            conn.close();
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return role; // إذا بقي null، سيعود لصفحة الـ login
    }
}