package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.Users;

public interface UserFindPwInterface {

	public abstract void getUserPw(Users user) throws SQLException; // 사용자 조회
	
}
