package catshap.butler.interfaces;

import catshap.butler.bean.UserAuthcode;

public interface UserAuthcodeVerifyInterface {

	public abstract int insertUserAuthcode(UserAuthcode userAuthcode); // 비밀번호 찾기 인증코드 추가

}
