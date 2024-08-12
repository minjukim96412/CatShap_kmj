package catshap.butler.exception;

@SuppressWarnings("serial")
public class UserPwNotFoundException extends Exception {
	public UserPwNotFoundException() {
		super("올바르지 않은 정보입니다. 다시 입력해주세요!");
	}
}
