
import 'package:flutter_starter_kit/feature/auth/logic/auth_cubit.dart';
import 'package:flutter_starter_kit/feature/auth/data/auth_state.dart';
import 'package:flutter_starter_kit/common/text_fields/custom_text_field.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: emailController,
            hintText: "name@domain.com",
            labelText: "EMAIL ADDRESS",
            validator: (value) => Tvalidator.validateEmail(value),
            showPasswordHideButton: false,
          ),


          const SizedBox(height: 24),
      
          //-- Password Field
          CustomTextField(
            controller: passwordController,
            hintText: "••••••••",
            labelText: "PASSWORD",
            validator: (value) => Tvalidator.validatePassword(value),
            showPasswordHideButton: true,
          ),
          
          const SizedBox(height: 24),

          //--forgot password button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () { context.push(TAppRouter.forgotPassword); },
              child: Text("Forgot Password?", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 16),
      
          //-- Sign In Button
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthOtpRequired && state.purpose == 'login') {
                //nav is success then Hum 'state.email' bhi bhej rahe hain takay OTP verify karte waqt kaam aaye
                context.push(TAppRouter.otpVerify, extra: {
                  'email': state.email,
                  'purpose': state.purpose,
                });
              } else if (state is AuthError) {
                // Error show karo actual message ke saath
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              return SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: state is AuthLoading ? null : () {
                  if(loginFormKey.currentState!.validate()){
                    //call login api
                    context.read<AuthCubit>().loginWithEmail(emailController.text, passwordController.text);
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                ),
                child: state is AuthLoading ? 
                SizedBox(height: 20, width: 20, child: const CircularProgressIndicator(color: TColors.primaryYellow,)) 
                : const Text("SIGN IN", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              );
            }
          ),
        ],
      ),
    );
  }
}
