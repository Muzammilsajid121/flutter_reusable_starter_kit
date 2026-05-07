import 'package:flutter_starter_kit/common/snackbars/snackbar.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/common/shimmer/dummy_shimmer_screen.dart';
import 'package:flutter_starter_kit/common/buttons/reusable_loader_button.dart';
import 'package:flutter_starter_kit/common/reusable_timer_widget.dart';
import 'package:flutter_starter_kit/common/layouts/grid_layout.dart';

class ShimmerLoaderScreen extends StatefulWidget {
  const ShimmerLoaderScreen({super.key});

  @override
  State<ShimmerLoaderScreen> createState() => _ShimmerLoaderScreenState();
}

class _ShimmerLoaderScreenState extends State<ShimmerLoaderScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmers & Others'),
        actions: [
          IconButton(
            onPressed: () => setState(() => _isLoading = !_isLoading),
            icon: Icon(_isLoading ? Iconsax.eye : Iconsax.eye_slash),
          )
        ],
      ),
      body: _isLoading 
        ? const SingleChildScrollView(child: DummyScreenShimmer()) 
        : _buildActualContent(),
    );
  }

  Widget _buildActualContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reusable Timer', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.defaultSpaceBtwItem),
          
          Center(
            child: ReusableCountdownTimer(
              minutes: 60,
              onTimerFinished: () {
                ReusableSnackbars.successSnackBar(context: context, title: 'TimerFinished!');
              },
            ),
          ),
          
          const SizedBox(height: TSizes.defaultSpaceBtwSection),
          
          Text('Individual Shimmer Effects', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.defaultSpaceBtwItem),
          
          Row(
            children: [
              const TShimmerEffect(width: 50, height: 50, radius: 50),
              const SizedBox(width: TSizes.md),
              Expanded(
                child: Column(
                  children: [
                    const TShimmerEffect(width: double.infinity, height: 15),
                    const SizedBox(height: 8),
                    const TShimmerEffect(width: 150, height: 15),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
          
          Text('Grid Layout Example', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
          
          TGridLayout(
            itemcount: 4,
            mainAxisExtent: 100,
            itembuilder: (context, index) => Container(
              decoration: BoxDecoration(
                color: TColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text('Item $index')),
            ),
          ),
          
          const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
          
          ReusableLoaderButton(
            text: 'Toggle Loading State',
            onTap: () => setState(() => _isLoading = true),
          ),
        ],
      ),
    );
  }
}
