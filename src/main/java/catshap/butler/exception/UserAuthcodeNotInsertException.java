package catshap.butler.exception;

@SuppressWarnings("serial")
public class UserAuthcodeNotInsertException extends Exception {
	public UserAuthcodeNotInsertException() {
		super("인증코드 등록 실패했습니다.");
	}
}
