

import 'package:flutter_starter_kit/feature/auth/presentation/forgot_password/set_new_password_screen.dart';
import 'package:flutter_starter_kit/feature/auth/presentation/login/login_screen.dart';
import 'package:flutter_starter_kit/feature/auth/presentation/otp_verify/otp_verify_screen.dart';
import 'package:flutter_starter_kit/feature/badges_milestones/presentation/badges_milestone_screen.dart';
import 'package:flutter_starter_kit/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:flutter_starter_kit/appCheckScreens/app_check_screen.dart';
import 'package:flutter_starter_kit/appCheckScreens/widgets_gallery_screen.dart';
import 'package:flutter_starter_kit/appCheckScreens/dialog_snackbar_screen.dart';
import 'package:flutter_starter_kit/appCheckScreens/shimmer_loader_screen.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';

class TAppRouter {
  // Route Names (Constants) takay spelling mistake na ho
  static const String appCheck = '/';
  static const String splash = '/splash';
  // static const String onboarding = '/'; // tells that this is the initial starting point of app
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String subscription = '/subscription';
  static const String leaderBoard = '/leaderBoard';
  static const String setting = '/setting';
  static const String examStart = '/examStart';
  static const String examInfo = '/examInfo';
  static const String questionsSection = '/questionsSection';
  static const String examResult = '/examResult';
  static const String otpVerify = '/otpVerify';
  static const String badgesMilestone = '/badgesMilestone';
  static const String profile = '/profile';
  static const String customNavBar = '/CustomNavBar';
  static const String forgotPassword = '/forgotPassword';
  static const String setNewPassword = '/SetNewPasswordScreen';
  static const String questionSection = '/QuestionSectionScreen';
  static const String analyticscreen = '/AnalyticsScreen';
  static const String userInputscreen = '/userInputscreen';
  static const String aiReponseScreen = '/aiReponseScreen';
  static const String widgetGallery = '/widgetGallery';
  static const String dialogSnackbar = '/dialogSnackbar';
  static const String shimmerLoader = '/shimmerLoader';

  static final GoRouter router = GoRouter(
    initialLocation: appCheck,
    debugLogDiagnostics: true, // Console mein routing logs dekhne ke liye
    routes: [
      // Login Route
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),

      // Dashboard Route
      GoRoute(
        path: dashboard,
        name: 'dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),



      GoRoute(
        path: otpVerify,
        name: 'otpVerify',
        builder: (context, state) {
          String email = '';
          String purpose = 'login';

          if (state.extra is Map<String, dynamic>) {
            final extraData = state.extra as Map<String, dynamic>;
            email = extraData['email'] ?? '';
            purpose = extraData['purpose'] ?? 'login';
          } else if (state.extra is String) {
            email = state.extra as String;
          }

    return OTPScreen(email: email, purpose: purpose);
  },
),

      // Set New Password Route
      GoRoute(
        path: setNewPassword,
        name: 'setNewPassword',
        builder: (context, state) {
          // Yahan state.extra mein hum String (email) bhejenge
          final resetToken = state.extra as String? ?? '';
          return SetNewPasswordScreen(resetToken: resetToken);
        },
      ),


      GoRoute(
        path: badgesMilestone,
        name: 'badgesMilestone',
        builder: (context, state) => const BadgesMilestoneScreen(),
      ),

      // App Check Screen Route
      GoRoute(
        path: appCheck,
        name: 'appCheck',
        builder: (context, state) => const AppCheckScreen(),
      ),
      GoRoute(
        path: widgetGallery,
        name: 'widgetGallery',
        builder: (context, state) => const WidgetsGalleryScreen(),
      ),
      GoRoute(
        path: dialogSnackbar,
        name: 'dialogSnackbar',
        builder: (context, state) => const DialogSnackbarScreen(),
      ),
      GoRoute(
        path: shimmerLoader,
        name: 'shimmerLoader',
        builder: (context, state) => const ShimmerLoaderScreen(),
      ),
      
    ],
    
    // Optional: Error Page (Agar koi galat route par jaye)
    errorBuilder: (context, state) => const Scaffold(body: Center(child: Text('Page not found'))),
  );
}



//--Usage Details
//**Simple Push: context.push(TAppRouter.login); (Wapis aa sakte hain)

//**Replace (Onboarding se Login ke liye): context.go(TAppRouter.login); (Wapis nahi ja sakte, stack clear ho jata hai)

//**Named Navigation: context.goNamed('login');