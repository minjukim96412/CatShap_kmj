package catshap.butler.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import catshap.butler.bean.ReviewView;
import catshap.butler.dao.ReviewViewDao;
import catshap.butler.interfaces.ReviewViewInterface;

@WebServlet("/RegistReview") // 올바른 URL 패턴 사용
public class RegistReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 126574856513248651L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // JSON 요청 바디 파싱
        Gson gson = new Gson();
        ReviewView review = gson.fromJson(request.getReader(), ReviewView.class);

        // ReviewViewDao를 통해 데이터베이스에 리뷰 저장
        ReviewViewInterface reviewDao = new ReviewViewDao();
        try {
            int result = reviewDao.registReview(review);
            response.setContentType("application/json");
            response.getWriter().write(gson.toJson(new ResponseMessage(result > 0)));
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write(gson.toJson(new ResponseMessage(false)));
        }
    }

    // 응답 메시지 클래스
    private static class ResponseMessage {
        private boolean success;

        public ResponseMessage(boolean success) {
            this.success = success;
        }

        public boolean isSuccess() {
            return success;
        }
    }
}