package catshap.butler.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import catshap.butler.bean.Users;

@WebServlet("/user-info")
public class UserInfoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        JsonObject jsonResponse = new JsonObject();
        if (user != null) {
        	jsonResponse.addProperty("userNo", user.getUserNo());
        	jsonResponse.addProperty("usid", user.getUsid());
            jsonResponse.addProperty("uname", user.getUname());
            jsonResponse.addProperty("unick", user.getUnick());
            jsonResponse.addProperty("uphone", user.getUphone());
            jsonResponse.addProperty("email", user.getEmail());
            jsonResponse.addProperty("umailAddress", user.getUmailAddress());
            jsonResponse.addProperty("uaddress", user.getUaddress());
            jsonResponse.addProperty("udetailAddress", user.getUdetailAddress());
        } else {
            jsonResponse.addProperty("error", "User not logged in");
        }

        response.setContentType("application/json; charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.print(jsonResponse.toString());
            out.flush();
        }
    }
}
