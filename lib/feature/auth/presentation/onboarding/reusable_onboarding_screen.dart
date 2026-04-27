import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';

class ReusableOnboardingScreen extends StatelessWidget {
  final String title1, title2, description, image, currentStep;
  final int index;
  final VoidCallback onNext, onSkip;

  const ReusableOnboardingScreen({
    super.key,
    required this.title1,
    required this.title2,
    required this.description,
    required this.image,
    required this.currentStep,
    required this.index,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( 
        children: [
          //--bg lab image
          Positioned(
            bottom: -5, right: 30,
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(TImages.labBig, height: 195), //
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(TSizes.defaultHorizontalSideSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                //-- Skip Button
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: onSkip,
                    child: Text("SKIP", style: Theme.of(context).textTheme.bodyMedium!.copyWith(letterSpacing: 1, fontWeight: FontWeight.bold, color: TColors.greyWidgetbg)),
                  ),
                ),
                
                //-- Image
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10))]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(image, height: 326, width: 326, fit: BoxFit.cover),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                //-- Title (Master Your Curriculum)
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.displayLarge!.copyWith( fontWeight: FontWeight.w900),
                    children: [
                      TextSpan(text: title1, style: const TextStyle(color: Colors.black)),
                      TextSpan(text: title2, style: TextStyle(color: TColors.textBrownColor)),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                Text(description, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Color(0xff4F4633), fontWeight: FontWeight.w300, height: 1.2)),

                const Spacer(),

                //-- Step Indicators (Dots)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (idx) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 6,
                    width: idx == index ? 32 : 8, // Active dot lambi hogi
                    decoration: BoxDecoration(
                      color: idx == index ? TColors.primaryYellow : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )),
                ),

                const SizedBox(height: 40),

                //-- Bottom Steps and Next Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //steps
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("STEP", style: Theme.of(context).textTheme.labelSmall!.copyWith(letterSpacing: 2, color: Colors.grey)),
                        Text("$currentStep/03", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    // Next Button
                    GestureDetector(
                      onTap: onNext,
                      child: Container(
                        height: 64, width: 72,
                        decoration: BoxDecoration(
                          color: TColors.primaryYellow,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: TColors.primaryYellow.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))]
                        ),
                        child: const Icon(Icons.arrow_forward, size: 28, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

