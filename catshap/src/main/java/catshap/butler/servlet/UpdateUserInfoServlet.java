package catshap.butler.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;

import catshap.butler.bean.Users;
import catshap.butler.dao.UserDao;

@WebServlet("/update-user-info")
public class UpdateUserInfoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false); // 현재 세션이 없으면 null 반환
		if (session == null) {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "로그인 상태가 아닙니다");
			return;
		}

		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "로그인 상태가 아닙니다");
			return;
		}

		// JSON 데이터 읽기
		StringBuilder sb = new StringBuilder();
		try (BufferedReader reader = request.getReader()) {
			String line;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		}

		JsonObject jsonRequest;
		try {
			jsonRequest = JsonParser.parseString(sb.toString()).getAsJsonObject();
		} catch (JsonSyntaxException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 JSON 형식입니다");
			return;
		}

		// 사용자 정보 업데이트
		try {
			user.setUname(jsonRequest.get("uname").getAsString());
			user.setUnick(jsonRequest.get("unick").getAsString());
			user.setUphone(jsonRequest.get("uphone").getAsString());
			user.setEmail(jsonRequest.get("email").getAsString());
			user.setUmailAddress(jsonRequest.get("umailAddress").getAsString());
			user.setUaddress(jsonRequest.get("uaddress").getAsString());
			user.setUdetailAddress(jsonRequest.get("udetailAddress").getAsString());

			// MyBatis DAO를 통한 업데이트
			int result = userDao.updateUser(user);
			if (result > 0) {
				// 세션 정보 갱신
				session.setAttribute("user", user);

				// 성공 응답
				response.setContentType("application/json; charset=UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.print("{\"success\": true}");
					out.flush();
				}
			} else {
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "사용자 정보 업데이트 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "사용자 정보 업데이트 중 오류 발생");
		}
	}
}
