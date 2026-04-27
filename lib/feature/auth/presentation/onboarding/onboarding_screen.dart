
import 'package:flutter_starter_kit/feature/auth/presentation/onboarding/reusable_onboarding_screen.dart';
import 'package:flutter_starter_kit/router/app_router.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // Teeno screens ka data
    final List<Map<String, String>> onboardingData = [
      {
        "t1": "Master Your\n",
        "t2": "Curriculum.",
        "desc": "Tailored study plans and practice papers for A-Level Physics and Chemistry.",
        "img": TImages.onboardingImage, //
      },
      {
        "t1": "Track Your\n",
        "t2": "Progress.",
        "desc": "Detailed analytics to help you identify strengths and improve your score daily.",
        "img": TImages.diagramView, //
      },
      {
        "t1": "Achieve\n",
        "t2": "Excellence.",
        "desc": "Join thousands of scholars achieving their dream grades with Lumina Academy.",
        "img": TImages.user3, //
      },
    ];

    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (value) => setState(() => _currentPage = value),
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          final data = onboardingData[index];
          return ReusableOnboardingScreen(
            index: index,
            title1: data["t1"]!,
            title2: data["t2"]!,
            description: data["desc"]!,
            image: data["img"]!,
            currentStep: "0${index + 1}",
            onSkip: () => _controller.jumpToPage(2), // Direct last page par
            onNext: () {
              if (index < 2) {
                _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
              } else {
                //-- Login screen par navigate
                context.push(TAppRouter.login);
              }
            },
          );
        },
      ),
    );
  }
}

