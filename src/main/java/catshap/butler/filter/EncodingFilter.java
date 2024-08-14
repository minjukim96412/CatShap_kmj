package catshap.butler.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 필터 초기화 작업이 필요하면 여기에 구현
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // 요청과 응답 모두 UTF-8로 설정
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

        // 필터 체인 계속 진행
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
        // 필터 종료 시 정리 작업이 필요하면 여기에 구현
    }
}
