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

import catshap.butler.bean.UserAuthcode;
import catshap.butler.dao.UserAuthcodeVerifyDao;

@WebServlet("/user-authcode-verify")
public class UserAuthcodeVerifyServlet extends HttpServlet {

	private UserAuthcodeVerifyDao userAuthcodeVerifyDao;
	
	@Override
	public void init() throws ServletException {
		userAuthcodeVerifyDao = new UserAuthcodeVerifyDao();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JsonObject jsonResponse = new JsonObject();
		
        String inputAuthcode = request.getParameter("uauthcode");
        String usid = request.getParameter("usid");
        UserAuthcode userAuthcode =  userAuthcodeVerifyDao.getUserAuthcode(usid);
        System.out.println(userAuthcode);
        String authcode = userAuthcode.getUauthcode();
        if (inputAuthcode.equals(authcode)) {
        	jsonResponse.addProperty("success", true);
        } else {
        	jsonResponse.addProperty("success", false);
        }
        response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonResponse.toString());
		out.flush();
	}
	
}