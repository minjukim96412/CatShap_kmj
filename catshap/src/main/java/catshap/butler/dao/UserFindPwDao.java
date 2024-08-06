package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import javax.mail.MessagingException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Users;
import catshap.butler.interfaces.UserFindPwInterface;
import catshap.butler.util.EmailUtil;

public class UserFindPwDao implements UserFindPwInterface {

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
	public void getUserPw(Users user) throws SQLException {
		String upass;
		try (SqlSession ss = ssf.openSession()) {
			upass = ss.selectOne("user.getUserPw", user);
		}

		if (upass != null) {
			try {
				EmailUtil.sendEmail(user.getEmail(), "Your Password", "비밀번호: " + upass);
			} catch (MessagingException me) {
				me.printStackTrace();
			}
		}
	}

}
