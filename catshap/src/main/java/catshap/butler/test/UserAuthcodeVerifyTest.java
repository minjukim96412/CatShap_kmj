package catshap.butler.test;

import java.io.IOException;
import java.io.Reader;
import java.sql.Timestamp;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.UserAuthcode;
import catshap.butler.exception.UserAuthcodeNotVerifyException;

public class UserAuthcodeVerifyTest {

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

	public static void main(String[] args) {
		UserAuthcode userAuthcode = new UserAuthcode(1, "hong123", 123123, new Timestamp(System.currentTimeMillis()));
		try {
			insertUserAuthcode(userAuthcode);
		} catch (UserAuthcodeNotVerifyException e) {
			System.out.println(e.getMessage());
		}
			
	}

	// 인증코드 등록 확인 테스트
	private static void insertUserAuthcode(UserAuthcode userAuthcode) throws UserAuthcodeNotVerifyException {
		SqlSession ss = ssf.openSession();
		try {
			int result = ss.insert("userauthcode.insertUserAuthcode", userAuthcode);
			if (result > 0) {
				System.out.println("인증코드 테이블 등록 성공!");
			} else {
				throw new UserAuthcodeNotVerifyException();
			}
		} finally {
			ss.commit();
			ss.close();
		}
	}

}
