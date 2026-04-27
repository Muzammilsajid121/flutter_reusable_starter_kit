import 'package:flutter_starter_kit/feature/auth/logic/auth_cubit.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart' as g_sign_in;

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

 Future<void> _handleGoogleSignIn(BuildContext context) async {
    // Implementation commented out to fix compilation issues
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In not implemented'), backgroundColor: Colors.orange),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _handleGoogleSignIn(context),
            icon: Image.asset(TImages.google, height: 24),
            label: const Text("Google", 
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFF1F1F1)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
        const SizedBox(width: 16),

        //-- Apple Button
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () { context.push(TAppRouter.questionsSection);},
            icon: const Icon(Icons.apple, color: Colors.white, size: 24),
            label: const Text("Apple", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A1A1A),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
      ],
    );
  }
}
