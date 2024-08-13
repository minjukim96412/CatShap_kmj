package catshap.butler.interfaces;

import java.sql.SQLException;
import java.util.List;

import catshap.butler.bean.ReviewView;

public interface ReviewViewInterface {

	public abstract List<ReviewView> selectReviewList(int prodNo) throws Exception;

	int registReview(ReviewView review) throws SQLException;
	
}
