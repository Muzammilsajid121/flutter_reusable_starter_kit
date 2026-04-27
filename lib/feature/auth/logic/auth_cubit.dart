import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_kit/feature/auth/data/auth_repository.dart';
import 'package:flutter_starter_kit/feature/auth/data/auth_state.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/utils/exceptions/exceptions.dart';
import 'package:flutter_starter_kit/utils/local_storage/storage_utility.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository = AuthRepository();

  AuthCubit() : super(AuthInitial());

  // -- Email Login Flow
  Future<void> loginWithEmail(String email, String password) async {
    emit(AuthLoading());
    try {
      await _authRepository.loginWithEmail(email, password);
      emit(AuthOtpRequired(email, purpose: 'login')); // OTP screen par bhej do
    } catch (e) {
      final customException = TExceptions.fromDioError(e);
      emit(AuthError(customException.message));
    }
  }


  // -- OTP Verification Flow (works for login and reset password)
  Future<void> verifyOtp(String email, String otp, String purpose) async {
    emit(AuthLoading());
    try {
      final response = await _authRepository.verifyOtp(email, otp, purpose);
      final data = response.data;
      
      if (data['reset_token'] != null) {
        final resetToken = data['reset_token'];
        //* forgot password screen pr nav
        emit(AuthOtpVerified(email, resetToken)); 
      } 
      else if (purpose == 'login') {
        //-- save data in local storage
        final accessToken = data['tokens']['access_token'];
        final refreshToken = data['tokens']['refresh_token'];
        final studentId = data['student']['id'];
        final firstName = data['student']['first_name'];
        final lastName = data['student']['last_name'];
        final email = data['student']['email'];
        final levelType = data['student']['level_type'];
        //* login screen pr nav pr pehly token local m save
        final localStorage = TLocalStorage();
        await localStorage.saveData('access_token', accessToken);
        await localStorage.saveData('refresh_token', refreshToken);
        await localStorage.saveData('student_id', studentId);
        await localStorage.saveData('first_name', firstName);
        await localStorage.saveData('last_name', lastName);
        await localStorage.saveData('email', email);
        await localStorage.saveData('level_type', levelType);
        await localStorage.saveData('isOpenedfirstTime', true);
        emit(AuthOtpVerifiedBottomNav(email, accessToken, refreshToken, studentId)); 

      }
      else {
        emit(AuthError("Token missing in response"));
      }
    } catch (e) {
      final customException = TExceptions.fromDioError(e);
      emit(AuthError(customException.message));
    }
  }


  // -- Google Login Flow
  Future<void> loginWithGoogle(String googleToken) async {
    emit(AuthLoading());
    try {
      final response = await _authRepository.loginWithGoogle(googleToken);
      emit(Authenticated(response.data['token']));
    } catch (e) {
      emit(AuthError("Google Sign-In Failed"));
    }
  }


  // -- Forgot Password Request Otp
  Future<void> forgotPasswordRequestOtp(String email, String purpose) async {
    emit(AuthLoading());
    try {
      await _authRepository.forgotPasswordRequestOtp(email);
      emit(AuthOtpRequired(email, purpose: purpose)); // OTP screen par bhej do
    } catch (e) {
      final customException = TExceptions.fromDioError(e);
      emit(AuthError(customException.message));
    }
  }

  // -- Set New Password
  Future<void> setNewPassword(String newPassword, String resetToken) async {
    emit(AuthLoading());
    try {
      await _authRepository.setNewPassword(newPassword, resetToken);
      emit(AuthPasswordResetSuccess()); // login screen pr bhejo after new password set
    } catch (e) {
      final customException = TExceptions.fromDioError(e);
      emit(AuthError(customException.message));
    }
  }


  // -- Logout
  Future<void> logoutCompletely() async {
    emit(AuthLoading());
    try {
      await _authRepository.logout();
      // Clear saved tokens from local storage
      final localStorage = TLocalStorage();
      await localStorage.removeData('access_token');
      await localStorage.removeData('refresh_token');
      await localStorage.removeData('student_id');
      await localStorage.removeData('first_name');
      await localStorage.removeData('last_name');
      await localStorage.removeData('email');
      await localStorage.removeData('isOpenedfirstTime');
      await localStorage.removeData('levelType');
      debugPrint("Cleared all local data and logout successfully");
      emit(AuthLogoutSuccess()); // login screen pr bhejo after logout
    } catch (e) {
      final customException = TExceptions.fromDioError(e);
      emit(AuthError(customException.message));
    }
  }
}
