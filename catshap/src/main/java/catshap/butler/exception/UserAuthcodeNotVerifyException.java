package catshap.butler.exception;

@SuppressWarnings("serial")
public class UserAuthcodeNotVerifyException extends Exception {
	public UserAuthcodeNotVerifyException() {
		super("인증코드 등록 실패했습니다.");
	}
}
