package catshap.butler.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import catshap.butler.bean.Users;
import catshap.butler.dao.UserDao;
import catshap.butler.interfaces.UserInterface;

@WebServlet("/user-pw-recovery")
public class UserFindPwServlet extends HttpServlet {

	private UserInterface userDao;

	@Override
	public void init() throws ServletException {
		userDao = new UserDao();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Users user = new Users();
		user.setUname(request.getParameter("uname"));
		user.setUsid(request.getParameter("usid"));
		user.setEmail(request.getParameter("email"));
		
		JsonObject jsonResponse = new JsonObject();
		
		try {
			String upass = userDao.getUserPw(user);
			user.setUpass(upass);
			
			HttpSession session = request.getSession();
			if (upass != null) {
				session.setAttribute("user", user);
				JsonObject userJson = new JsonObject();
                userJson.addProperty("uname", user.getUname());
                userJson.addProperty("usid", user.getUsid());
                userJson.addProperty("email", user.getEmail());
                userJson.addProperty("upass", user.getUpass());
                jsonResponse.add("user", userJson);
                jsonResponse.addProperty("success", true);
			} else {
				jsonResponse.addProperty("success", false);
			}
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonResponse.toString());
			out.flush();	
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
}