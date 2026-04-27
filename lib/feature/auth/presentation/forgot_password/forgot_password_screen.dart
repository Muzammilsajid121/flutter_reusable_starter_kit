import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_kit/common/text_fields/custom_text_field.dart';
import 'package:flutter_starter_kit/feature/auth/data/auth_state.dart';
import 'package:flutter_starter_kit/feature/auth/logic/auth_cubit.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';

//* forgot password take the email send an otp using otp request api then otp verify will verify the otp and then set new password will set new password.
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text("Reset Password", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Form(
            key: forgotPasswordFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),

                // -- Forgot Password Text
                Text( "Forgot Password?",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith( fontWeight: FontWeight.w500, height: 1.1, ),
                ),
                const SizedBox(height: 16),

                // -- Description
                Text(
                  "Enter your email address and we will send you instructions to reset your password.",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith( color: TColors.greyWidgetbg, height: 1.5,  fontWeight: FontWeight.w400,fontSize: 18, ),
                ),
                const SizedBox(height: 48),

                // -- Email Input
                CustomTextField(
                  controller: emailController,
                  hintText: "name@brainiacs.edu",
                  labelText: "EMAIL ADDRESS",
                  validator: (value) => Tvalidator.validateEmail(value),
                  suffixIcon: Icons.mail_outline,
                  showPasswordHideButton: false,
                ),
                const SizedBox(height: 36),

                // -- Send Reset Link Button
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthOtpRequired && state.purpose == 'reset-password') {
                      context.push(
                        TAppRouter.otpVerify,
                        extra: {
                          'email': emailController.text.trim(),
                          'purpose': 'reset-password',
                        },
                      );
                    } else if (state is AuthError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message), backgroundColor: Colors.red),
                      );
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: state is AuthLoading
                            ? null
                            : () {
                                if (forgotPasswordFormKey.currentState!.validate()) {
                                  final email = emailController.text.trim();
                                  context.read<AuthCubit>().forgotPasswordRequestOtp(email, 'reset-password');
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: TColors.primaryYellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: state is AuthLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(color: Colors.black),
                              )
                            : Row(
                                spacing: 4,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Icon(Iconsax.arrow_right_1, color: Colors.black, size: 20),
                                ],
                              ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 48),

                // -- Footer: Remember Password?
                Center(
                  child: InkWell(
                    onTap: () => context.pop(),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: "Remember your password? ",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: TColors.greyWidgetbg,
                                ),
                          ),
                          TextSpan(
                            text: "Log in",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // -- Help Section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE082),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.help_outline, color: Color(0xFF5D4037)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Need help?",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              "Contact our academic support desk",
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: TColors.greyWidgetbg,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ),
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
