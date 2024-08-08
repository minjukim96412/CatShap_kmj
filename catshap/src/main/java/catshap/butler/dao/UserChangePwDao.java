package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Users;
import catshap.butler.interfaces.UserChangePwInterface;

public class UserChangePwDao implements UserChangePwInterface {

	private static Reader reader = null;
	private static SqlSessionFactory ssf = null;

	static {
		try {
			reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
	@Override
	public int updateUserPw(Users user) throws SQLException {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("user.updateUserPw", user);
		ss.commit();
		ss.close();
		return result;
	}

}
