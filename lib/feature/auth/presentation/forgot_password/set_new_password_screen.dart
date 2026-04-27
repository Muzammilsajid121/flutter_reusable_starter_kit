import 'package:flutter_starter_kit/common/text_fields/custom_text_field.dart';
import 'package:flutter_starter_kit/feature/auth/data/auth_state.dart';
import 'package:flutter_starter_kit/feature/auth/logic/auth_cubit.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/common/snackbars/snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetNewPasswordScreen extends StatelessWidget {
  final String resetToken;
  const SetNewPasswordScreen({super.key, required this.resetToken});

  @override
  Widget build(BuildContext context) {
    print("reset token is $resetToken");
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state){
          //*if password reset success then go to login screen
          if(state is AuthPasswordResetSuccess){
            context.go(TAppRouter.login);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Password changed successfully! Please login.")),
            );
          }
          //*if error then show error
          if(state is AuthError){
                        ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.message}")),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //-- Header (Logo + Welcome Text)
                const SetNewPasswordHeader(),
                const SizedBox(height: 48),
        
                //-- Form (Email + Password + Forgot Password)
                SetNewPasswordForm(email: "", resetToken: resetToken),
                const SizedBox(height: 36),
        
            
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}








//--set new password form
class SetNewPasswordForm extends StatefulWidget {
  final String email;
  final String resetToken;
  const SetNewPasswordForm({super.key, required this.email, required this.resetToken});

  @override
  State<SetNewPasswordForm> createState() => _SetNewPasswordFormState();
}

class _SetNewPasswordFormState extends State<SetNewPasswordForm> {
  //controllers
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final setNewPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: setNewPasswordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: newPasswordController,
            hintText: "••••••••",
            labelText: "NEW PASSWORD",
            validator: (value) => Tvalidator.validatePassword(value),
            showPasswordHideButton: true,
          ),

         
          const SizedBox(height: 24),
      
          //-- Password Field
          CustomTextField(
            controller: confirmPasswordController,
            hintText: "••••••••",
            labelText: "CONFIRM PASSWORD",
            validator: (value) => Tvalidator.validateForgotPassword(value),
            showPasswordHideButton: true,
          ),
          
          const SizedBox(height: 24),
      
          //-- Set New Password Button
              SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: (){
                   if(newPasswordController.text != confirmPasswordController.text){
                    ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Passwords do not match")),
            );
                  }
                  if(setNewPasswordFormKey.currentState!.validate() && newPasswordController.text == confirmPasswordController.text){
                    context.read<AuthCubit>().setNewPassword(newPasswordController.text, widget.resetToken);
                  }
                 
                },
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                ),
                child:  const Text("SET NEW PASSWORD", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              )]
              )
            
          
        
      );
    
  }
}











//--set new password header
class SetNewPasswordHeader extends StatelessWidget {
  const SetNewPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //--Lumina academy logo and name
        Row(
          children: [
            Container(
              height: 44,    width: 44,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Color(0xFFFFC107), shape: BoxShape.circle),
              child: Image.asset(TImages.loginScreenBulb, height: 20),
            ),
            const SizedBox(width: 12),
            Text("LUMINA ACADEMY", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),),
          ],
        ),
        const SizedBox(height: 32),
        //-- Welcome back, Scholar
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.displayLarge!.copyWith(),
            children: [
              const TextSpan(text: "Set New Password"),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text("Enter your new password to continue your journey with Brainiacs Digital Academy.", style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 1.1, color: TColors.greyWidgetbg, fontWeight: FontWeight.w300),),
      ],
    );
  }
}
