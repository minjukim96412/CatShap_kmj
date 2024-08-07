package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Random;

import javax.mail.MessagingException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.UserAuthcode;
import catshap.butler.bean.Users;
import catshap.butler.interfaces.UserAuthcodeVerifyInterface;
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
	public String getUserPw(Users user) throws SQLException {
		SqlSession ss = ssf.openSession();
		Users getUser = ss.selectOne("user.getUser", user);
		if (getUser != null) {
			String uauthCode = generateAuthCode();
			String subject = "귀하의 인증 코드";
			String message = String.format(
					"%s님,\n\n" + "귀하의 이메일 주소를 통해 계정 %s에 대한 액세스가 요청되었습니다. " + "인증 코드는 다음과 같습니다.\n\n" + "%s\n\n"
							+ "이 코드를 요청하지 않았다면 다른 사람이 계정 %s에 액세스하려고 시도하는 것일 수 있습니다. "
							+ "누구에게도 이 코드를 전달하거나 제공하면 안됩니다.\n\n" + "감사합니다.\n\n" + "Catshap 계정팀",
					getUser.getUname(), getUser.getEmail(), uauthCode, getUser.getEmail());

			try {
				EmailUtil.sendEmail(getUser.getEmail(), subject, message);
			} catch (MessagingException me) {
				me.printStackTrace();
			}
			
			// 인증코드 객체 저장
			UserAuthcode userAuthcode = new UserAuthcode(getUser.getUserNo(), getUser.getUsid(),
					uauthCode, new Timestamp(System.currentTimeMillis()));
			UserAuthcodeVerifyInterface uAuthcodeInterface = new UserAuthcodeVerifyDao();
			uAuthcodeInterface.insertUserAuthcode(userAuthcode);
			ss.close();
			return getUser.getUpass();			
		}
		return null;
	}

	// 인증 코드 생성 메서드
	private String generateAuthCode() {
		Random random = new Random();
		int code = 100000 + random.nextInt(900000); // 6자리 인증 코드 생성
		return String.valueOf(code);
	}

}
