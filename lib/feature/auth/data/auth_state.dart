// auth_state.dart

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthOtpRequired extends AuthState {
  final String email;
  final String purpose;
  AuthOtpRequired(this.email, {this.purpose = 'login'});
}

class AuthOtpVerified extends AuthState { final String email; final String resetToken; AuthOtpVerified(this.email, this.resetToken,);}

//-- for login and redirect to CustomNavBar(Dashboard)
class AuthOtpVerifiedBottomNav extends AuthState { final String email; final String accessToken; final String refreshToken; final String studentId; AuthOtpVerifiedBottomNav(this.email, this.accessToken, this.refreshToken, this.studentId,);}


class AuthPasswordResetSuccess extends AuthState {}  //--to redirect on login screen

class Authenticated extends AuthState {
  final String token;
  Authenticated(this.token);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthLogoutSuccess extends AuthState {}  // to redirect to login screen
