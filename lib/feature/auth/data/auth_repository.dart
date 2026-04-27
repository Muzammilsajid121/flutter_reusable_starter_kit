import 'package:dio/dio.dart';
import 'package:flutter_starter_kit/apis/dio_helper.dart';

class AuthRepository {
  //-- 1. Email Login (to get otp)
  Future<Response> loginWithEmail(String email, String password) async {
    try {
      return await TDioHelper.post('student/auth/login', {
        'email': email,
        'password': password,
      });
    } catch (e) {
      rethrow;
    }
  }

  //-- 2. Verify OTP (purpose is login or reset-password || reset password provides reset_token)
  Future<Response> verifyOtp(String email, String otp, String purpose) async {
    try {
      return await TDioHelper.post('student/auth/otp/verify', {
        'email': email,
        'otp_code': otp,
        'purpose': purpose,
      });
    } catch (e) {
      rethrow;
    }
  }

  //-- 3. Google Login
  Future<Response> loginWithGoogle(String googleToken) async {
    try {
      return await TDioHelper.post('student/auth/google/login', {
        'token': googleToken,
      });
    } catch (e) {
      rethrow;
    }
  }

  //-- 4. Forgot Password (Send OTP)
  Future<Response> forgotPasswordRequestOtp(String email) async {
    try {
      return await TDioHelper.post('student/auth/otp/request', {
        'email': email,
        'purpose': 'reset-password',
      });
    } catch (e) {
      rethrow;
    }
  }

  //-- 5. Set New Password
  Future<Response> setNewPassword(String newPassword, String resetToken) async {
    try {
      return await TDioHelper.post('student/auth/reset-password', {
        'new_password': newPassword,
        'reset_token': resetToken,
      });
    } catch (e) {
      rethrow;
    }
  }


  //-- 6. Logout from app
  Future<Response> logout() async {
    try {
      final response = await TDioHelper.post('student/auth/logout', {});
      return response;
    } catch (e) {
      rethrow;
    }
  }



}