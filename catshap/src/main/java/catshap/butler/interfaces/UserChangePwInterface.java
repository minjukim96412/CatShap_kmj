package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.Users;

public interface UserChangePwInterface {

	public abstract int updateUserPw(Users user) throws SQLException;
	
}
