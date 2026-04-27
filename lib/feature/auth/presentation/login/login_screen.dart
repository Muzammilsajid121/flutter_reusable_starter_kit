import 'package:flutter_starter_kit/feature/auth/presentation/login/widgets/login_form.dart';
import 'package:flutter_starter_kit/feature/auth/presentation/login/widgets/login_header.dart';
import 'package:flutter_starter_kit/feature/auth/presentation/login/widgets/social_login_buttons.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-- Header (Logo + Welcome Text)
              const LoginHeader(),
              const SizedBox(height: 48),

              //-- Form (Email + Password + Forgot Password)
              const LoginForm(),
              const SizedBox(height: 36),

              //-- Divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1, color: Color(0xFFF1F1F1))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "OR CONTINUE WITH",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey, letterSpacing: 1),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1, color: Color(0xFFF1F1F1))),
                ],
              ),
              const SizedBox(height: 32),

              //-- Social Buttons (Google + Apple)
              const SocialLoginButtons(),
              const SizedBox(height: 48),

              //-- Footer (Create Account)
              Center(
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(text: "Don't have an account? ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.greyWidgetbg)),
                      TextSpan(text: "Create Account", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





