package catshap.butler.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/check-login-status")
public class CheckLoginStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1156456132189L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("user") != null);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"loggedIn\": " + loggedIn + "}");
        out.flush();
    }
}
