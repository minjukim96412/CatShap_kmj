package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.Users;

public interface UserFindIdInterface {

	public abstract String getUserId(Users user) throws SQLException; // 사용자 조회

}
