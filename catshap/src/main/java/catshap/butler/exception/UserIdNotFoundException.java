package catshap.butler.exception;

@SuppressWarnings("serial")
public class UserIdNotFoundException extends Exception {
	public UserIdNotFoundException() {
		super("미가입 사용자입니다. 회원가입을 해주세요!");
	}
}
