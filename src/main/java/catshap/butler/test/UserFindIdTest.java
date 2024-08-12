package catshap.butler.test;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Users;
import catshap.butler.exception.UserIdNotFoundException;

public class UserFindIdTest {

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
		Users user = new Users();
		user.setUname("홍길동");
		user.setEmail("hong@example.com");

		try {
            String usid = userExist(user);
            System.out.println(user.getUname() + "님의 아이디: " + usid);
        } catch (UserIdNotFoundException e) {
            System.out.println(e.getMessage());
        }
	}

	// 사용자 가입여부 확인 테스트
	public static String userExist(Users user) throws UserIdNotFoundException {
		SqlSession ss = ssf.openSession();
		try {
			String usid = ss.selectOne("user.getUserId", user);
			if (usid != null) {
				return usid;
			} else {
				throw new UserIdNotFoundException();
			}
		} finally {
			ss.close();
		}
	}

}
