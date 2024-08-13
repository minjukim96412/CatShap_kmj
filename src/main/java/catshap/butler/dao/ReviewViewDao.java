package catshap.butler.dao;

import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.ReviewView;
import catshap.butler.bean.Users;
import catshap.butler.interfaces.ReviewViewInterface;

public class ReviewViewDao implements ReviewViewInterface {

	private static Reader reader = null;
	private static SqlSessionFactory ssf = null;
	
	static {
		try {
			reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@Override
	public List<ReviewView> selectReviewList(int prodNo) throws Exception {
		return ssf.openSession().selectList("reviewview.selectReviewList",prodNo);
	}
	
	@Override
    public int registReview(ReviewView reviewView) throws SQLException {
        try (SqlSession ss = ssf.openSession()) {
            int result = ss.insert("reviewview.registReview", reviewView);
            ss.commit();
            return result;
        }
    }
}
