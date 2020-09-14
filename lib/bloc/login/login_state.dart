import 'package:equatable/equatable.dart';

enum LoginStatus { none, submissionInProgress, submissionSuccess, submissionFailed, submissionFailedGoToSignUp }
enum SignUpFormField { email, password }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.none,
  });

  final LoginStatus status;

  const LoginState.none() : this();
  const LoginState.submissionInProgress() : this(status: LoginStatus.submissionInProgress);
  const LoginState.submissionSuccess() : this(status: LoginStatus.submissionSuccess);
  const LoginState.submissionFailed() : this(status: LoginStatus.submissionFailed);
  const LoginState.submissionFailedGoToSignUp() : this(status: LoginStatus.submissionFailedGoToSignUp);

  LoginState copyWith({
    LoginStatus status,
  }) {
    return LoginState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [];
}
