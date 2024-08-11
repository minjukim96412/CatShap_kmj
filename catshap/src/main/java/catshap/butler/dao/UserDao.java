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
import catshap.butler.interfaces.UserInterface;
import catshap.butler.util.EmailUtil;

public class UserDao implements UserInterface {

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
	public Users getUser(Users user) throws SQLException {
		SqlSession ss = ssf.openSession();
		Users getUser = ss.selectOne("user.getUser", user);
		ss.close();
		return getUser;
	}

	@Override
	public String getUserId(Users user) throws SQLException {
		SqlSession ss = ssf.openSession();
		String usid = ss.selectOne("user.getUserId", user);
		ss.close();
		return usid;
	}

	@Override
	public String getUserPw(Users user) throws SQLException {
		SqlSession ss = ssf.openSession();
		Users getUser = ss.selectOne("user.getUserPw", user);
		if (getUser != null) {
			String uauthCode = generateAuthCode();
			// 인증코드 메일 전송
			sendAuthcodeEmail(getUser, uauthCode);
			// 인증코드 객체 저장
			setUserAuthcode(getUser, uauthCode);

			ss.close();
			return getUser.getUpass();
		}
		return null;
	}

	@Override
	public int updateUserPw(Users user) throws SQLException {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("user.updateUserPw", user);
		ss.commit();
		ss.close();
		return result;
	}

	@Override
	public int insertUserAuthcode(UserAuthcode userAuthcode) {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("userauthcode.insertUserAuthcode", userAuthcode);
		ss.commit();
		ss.close();
		return result;
	}

	@Override
	public UserAuthcode getUserAuthcode(String usid) {
		SqlSession ss = ssf.openSession();
		UserAuthcode userAuthcode = ss.selectOne("userauthcode.getUserAuthcode", usid);
		ss.close();
		return userAuthcode;
	}

	@Override
	public int updateUserAuthcode(UserAuthcode userAuthcode) {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("userauthcode.updateUserAuthcode", userAuthcode);
		ss.commit();
		ss.close();
		return result;
	}

	// 인증번호 메일 전송 메서드
	private void sendAuthcodeEmail(Users user, String uauthCode) {
		String subject = "귀하의 인증 코드";
		String message = String.format("%s님,\n\n" + "귀하의 이메일 주소를 통해 계정 %s에 대한 액세스가 요청되었습니다. " + "인증 코드는 다음과 같습니다.\n\n"
				+ "%s\n\n" + "이 코드를 요청하지 않았다면 다른 사람이 계정 %s에 액세스하려고 시도하는 것일 수 있습니다. "
				+ "누구에게도 이 코드를 전달하거나 제공하면 안됩니다.\n\n" + "감사합니다.\n\n" + "Catshap 계정팀", user.getUname(), user.getEmail(),
				uauthCode, user.getEmail());

		try {
			EmailUtil.sendEmail(user.getEmail(), subject, message);
		} catch (MessagingException me) {
			me.printStackTrace();
		}
	}

	// 인증 코드 생성 메서드
	private String generateAuthCode() {
		Random random = new Random();
		int code = 100000 + random.nextInt(900000); // 6자리 인증 코드 생성
		return String.valueOf(code);
	}

	// 인증 코드 객체 저장 메서드
	private void setUserAuthcode(Users user, String uauthCode) {
		UserAuthcode existingAuthcode = getUserAuthcode(user.getUsid());
		UserAuthcode userAuthcode = new UserAuthcode(user.getUserNo(), user.getUsid(), uauthCode,
				new Timestamp(System.currentTimeMillis()));

		if (existingAuthcode != null) {
			updateUserAuthcode(userAuthcode);
		} else {
			insertUserAuthcode(userAuthcode);
		}
	}

	@Override
    public int registUser(Users users) throws SQLException {
        try (SqlSession ss =  ssf.openSession()) {
            int result = ss.insert("user.registUser", users);
            ss.commit();
            return result;
        }
    }

    @Override
    public boolean isUsidTaken(String usid) throws SQLException {
        try (SqlSession ss =  ssf.openSession()) {
            Integer count = ss.selectOne("user.isUsidTaken", usid);
            return count != null && count > 0;
        }
    }

    @Override
    public boolean isUnickTaken(String unick) throws SQLException {
        try (SqlSession ss =  ssf.openSession()) {
            Integer count = ss.selectOne("user.isUnickTaken", unick);
            return count != null && count > 0;
        }
    }
    
    @Override
    public int updateUser(Users user) throws SQLException  {
        try (SqlSession ss = ssf.openSession()) {
            int result = ss.update("user.updateUser", user);
            ss.commit();
            return result;
        }
    }
	
}
