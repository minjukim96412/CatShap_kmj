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
import catshap.butler.dao.UserFindIdDao;

@WebServlet("/user-id-recovery")
public class UserFindIdServlet extends HttpServlet {

	private UserFindIdDao userFindIdDao;

	@Override
	public void init() throws ServletException {
		userFindIdDao = new UserFindIdDao();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Users user = new Users();
		user.setUname(request.getParameter("uname"));
		user.setEmail(request.getParameter("email"));
		
		JsonObject jsonResponse = new JsonObject();
		
		try {
			String usid = userFindIdDao.getUserId(user);
			user.setUsid(usid);
			
			HttpSession session = request.getSession();
			if (usid != null) {
				session.setAttribute("user", user);
	            
				jsonResponse.addProperty("success", true);
				jsonResponse.addProperty("uname", user.getUname());
                jsonResponse.addProperty("email", user.getEmail());
                jsonResponse.addProperty("usid", usid);
			} else {
				jsonResponse.addProperty("success", false);
			}
			response.setContentType("application/json charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jsonResponse.toString());
			out.flush();	
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
}