abstract class AuthState {}
class AuthinitialState extends AuthState{}
class LoginLoadingState extends AuthState{}
class LoginSuccessState extends AuthState{}
class LoginFailureState extends AuthState{
  final String errmessage;
  LoginFailureState({required this.errmessage});
}
class RegisterLoadingState extends AuthState{}
class RegisterSuccessState extends AuthState{}
class RegisterFailureState extends AuthState{
  final String errmessage;
  RegisterFailureState({required this.errmessage});
}