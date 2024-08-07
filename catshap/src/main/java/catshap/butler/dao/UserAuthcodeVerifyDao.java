package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.UserAuthcode;
import catshap.butler.interfaces.UserAuthcodeVerifyInterface;

public class UserAuthcodeVerifyDao implements UserAuthcodeVerifyInterface {

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
	public int insertUserAuthcode(UserAuthcode userAuthcode) {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("userauthcode.insertUserAuthcode", userAuthcode);
		ss.close();
		return result;
	}

}
