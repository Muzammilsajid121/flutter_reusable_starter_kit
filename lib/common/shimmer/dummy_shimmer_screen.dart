import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';

//This is an dummy shimmer screen that can be call when data is loading from api. you can made shimmer design of any screen in the similar way.
class DummyScreenShimmer extends StatelessWidget {
  const DummyScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //appbar type
          TShimmerEffect(width: double.infinity, height: 70),
          const SizedBox(height: TSizes.md),
          /// Top Row (Question No + Timer)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TShimmerEffect(width: 120, height: 20),
              TShimmerEffect(width: 80, height: 20),
            ],
          ),

          const SizedBox(height: TSizes.md),

          /// Subject Tag
          TShimmerEffect(width: 90, height: 25),

          const SizedBox(height: TSizes.md),

          /// Title (Identify the Correct Option)
          TShimmerEffect(width: double.infinity, height: 28),
          const SizedBox(height: 6),
          TShimmerEffect(width: 200, height: 28),

          const SizedBox(height: TSizes.lg),

          /// Diagram / Question Card
          TShimmerEffect(
            width: double.infinity,
            height: 300,
            radius: 12,
          ),

          const SizedBox(height: TSizes.lg),

          /// Options Grid (2x2)
          Row(
            children: [
              Expanded(child: _optionCard()),
              const SizedBox(width: TSizes.md),
              Expanded(child: _optionCard()),
            ],
          ),

          const SizedBox(height: TSizes.md),

          Row(
            children: [
              Expanded(child: _optionCard()),
              const SizedBox(width: TSizes.md),
              Expanded(child: _optionCard()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _optionCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TShimmerEffect(
          width: double.infinity,
          height: 110,
          radius: 12,
        ),
        const SizedBox(height: 8),
        TShimmerEffect(width: 80, height: 14),
      ],
    );
  }
}