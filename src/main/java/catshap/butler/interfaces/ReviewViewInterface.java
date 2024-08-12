package catshap.butler.interfaces;

import java.util.List;

import catshap.butler.bean.ReviewView;

public interface ReviewViewInterface {

	public abstract List<ReviewView> selectReviewList(int prodNo) throws Exception;
	
}
