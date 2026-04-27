
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

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
            style: Theme.of(context).textTheme.displayLarge!.copyWith(height: 1.1),
            children: [
              const TextSpan(text: "Welcome back,\n"),
              TextSpan(text: "Scholar!", style: TextStyle(color: TColors.primaryYellow)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(  "Your journey to enlightenment\ncontinues here.", style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 1.1, color: TColors.greyWidgetbg, fontWeight: FontWeight.w300),),
      ],
    );
  }
}
