package catshap.butler.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import catshap.butler.bean.Users;
import catshap.butler.dao.UserDao;

@WebServlet("/update-user-info")
public class UpdateUserInfoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDao userDao = new UserDao(); // UserDao 인스턴스 생성

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false); // 세션이 없으면 null 반환
        if (session == null || session.getAttribute("userNo") == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }

        int userNo = (Integer) session.getAttribute("userNo");

        // JSON 데이터 파싱 및 사용자 정보 업데이트
        StringBuilder jsonData = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonData.append(line);
            }
        }

        JsonObject jsonObject = JsonParser.parseString(jsonData.toString()).getAsJsonObject();
        Users user = new Users();
        user.setUserNo(userNo);
        user.setUname(jsonObject.get("uname").getAsString());
        user.setUnick(jsonObject.get("unick").getAsString());
        user.setUtelecom(jsonObject.get("utelecom").getAsString());
        user.setUphone(jsonObject.get("uphone").getAsString());
        user.setEmail(jsonObject.get("email").getAsString());
        user.setUmailAddress(jsonObject.get("umailAddress").getAsString());
        user.setUaddress(jsonObject.get("uaddress").getAsString());
        user.setUdetailAddress(jsonObject.get("udetailAddress").getAsString());

        try {
            UserDao userDao = new UserDao();
            int result = userDao.updateUser(user);
            if (result > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("User information updated successfully.");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update user information.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating user information.");
        }
    }

}
