import 'package:flutter_starter_kit/feature/auth/logic/auth_cubit.dart';
import 'package:flutter_starter_kit/feature/auth/data/auth_state.dart';
import 'package:flutter_starter_kit/common/buttons/reusable_loader_button.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/utils/local_storage/storage_utility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  final String purpose;
  final String email;
  const OTPScreen({super.key, required this.email, required this.purpose});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // 6 Digits ke liye controllers aur focus nodes
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final OtpformKey = GlobalKey<FormState>();


  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  // Logic: Ek digit enter hone par agle box par move karna
  void _nextField(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: 
          BlocConsumer <AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                //* Normal Login Success
                context.go(TAppRouter.customNavBar);
              }
              
              if (state is AuthOtpVerified) {
                //* Forgot Password Success: Navigate to Set New Password
                // Hum state.email isliye use kar rahe hain kyunke Cubit se email wapis aa raha hai
                context.push(TAppRouter.setNewPassword, extra: state.resetToken);
              }

              if (state is AuthOtpVerifiedBottomNav) {
                //* Direct Login if otp verified
                // Hum state.email isliye use kar rahe hain kyunke Cubit se email wapis aa raha hai
                context.go(TAppRouter.customNavBar );
              }
              
              if (state is AuthError) {
                // Show error message logic
              }
            },
            builder: (context, state){  
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Verify Email", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(  "Enter the 6-digit code sent to ${widget.email}",style: TextStyle(color: Colors.grey, fontSize: 16), ),
                const SizedBox(height: 48),
            
                // --- OTP Input Fields Row ---
                Form(
                  key: OtpformKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) => SizedBox(
                      width: 45,
                      child: TextFormField(
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18, fontWeight: FontWeight.w700, color: TColors.black,
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "";
                          }
                          return null;
                        },
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        autofocus: index == 0,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        // style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          counterText: "", // Hide character counter
                          errorStyle: const TextStyle(height: 0), // ✅ Error text ki height zero kar dein
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFFFC107), width: 2),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF9F9F9),
                        ),
                        onChanged: (value) => _nextField(value, index),
                      ),
                    )),
                  ),
                ),
            
                const SizedBox(height: 16),
            
                // --- Validation/Error Text ---
                if (state is AuthError)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red, fontSize: 13, fontWeight: FontWeight.normal),
                    ),
                  )
                else if (_controllers.any((controller) => controller.text.isEmpty))
                   const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Please enter the complete 6-digit code sent to your email.",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                
                const SizedBox(height: 32),
            
                // --- Verify Button (Aapka Reusable Button use kiya hai) ---
                ReusableLoaderButton(
                  text: "VERIFY & CONTINUE", isLoading: state is AuthLoading,
                  onTap: state is AuthLoading ? null : () {
                    if (OtpformKey.currentState!.validate()) {
                      String otp = _controllers.map((e) => e.text).join();
                      if (otp.length == 6) {
                        context.read<AuthCubit>().verifyOtp(widget.email, otp, widget.purpose);
                      }
                    }
                  },
                  fillColor: const Color(0xFFFFC107),
                  textColor: Colors.black,
                ),
            
                const SizedBox(height: 24),
            
                // --- Resend Code Section ---
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(text: "Didn't receive code? "),
                          TextSpan(
                            text: "Resend",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
        ),
      ),
    );
  }
}
