package catshap.butler.test;

import java.io.IOException;
import java.io.Reader;

import javax.mail.MessagingException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Users;
import catshap.butler.exception.UserPwNotFoundException;
import catshap.butler.util.EmailUtil;

public class UserFindPwTest {

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
		user.setUname("사용자");
		user.setUsid("user");
		user.setEmail("test@gmail.com");

		try {
			userExist(user);
		} catch (UserPwNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}

	// 사용자 비밀번호 찾기 확인 테스트
	public static void userExist(Users user) throws UserPwNotFoundException {
		String upass;
		try (SqlSession ss = ssf.openSession()) {
			upass = ss.selectOne("user.getUserPw", user);
		}

		if (upass != null) {
			try {
				System.out.println("이메일 전송 시작!");
				EmailUtil.sendEmail(user.getEmail(), "[CatShap] 비밀번호 찾기 본인인증 ", "비밀번호: " + upass);
				System.out.println("성공!!");
			} catch (MessagingException me) {
				me.printStackTrace();
			}
		}
	}

}
