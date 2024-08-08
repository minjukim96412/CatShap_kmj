package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.UserAuthcode;
import catshap.butler.bean.Users;

public interface UserInterface {

	public abstract String getUserId(Users user) throws SQLException; // 사용자 조회 - 아이디 찾기
	
	public abstract String getUserPw(Users user) throws SQLException; // 사용자 조회 - 비밀번호 찾기
	
	public abstract int updateUserPw(Users user) throws SQLException; // 비밀번호 업데이트
	
	public abstract int insertUserAuthcode(UserAuthcode userAuthcode); // 비밀번호 찾기 인증코드 추가

	public abstract UserAuthcode getUserAuthcode(String usid); // 인증코드 식별
	
	public abstract int updateUserAuthcode(UserAuthcode userAuthcode); // 인증코드 재발행
	
}
