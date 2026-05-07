import 'package:flutter_starter_kit/common/snackbars/snackbar.dart';
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/common/buttons/reusable_loader_button.dart';
import 'package:flutter_starter_kit/common/appbar/reusable_appbar_badge.dart';

class AppCheckScreen extends StatelessWidget {
  const AppCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('--- BUILDING APPCHECKSCREEN ---');
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Components Check'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: TSizes.md),
            child: ReusableAppBarBadge(
              onTap: () {
                //nav
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SolitaireGame()));
              },
              child: const Icon(Iconsax.setting_2, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const Text(
              'Welcome to the UI Kit! Use this screen to test and verify all common widgets and utilities.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: TSizes.defaultSpaceBtwItem),
            
            _buildCategoryCard(
              context,
              title: 'Buttons & Text Fields',
              subtitle: 'Check all reusable buttons and input fields',
              icon: Iconsax.element_3,
              onTap: () => context.push(TAppRouter.widgetGallery),
            ),
            
            const SizedBox(height: TSizes.defaultSpaceBtwItem),
            
            _buildCategoryCard(
              context,
              title: 'Dialogs & Snackbars',
              subtitle: 'Test popups, alerts, and notifications',
              icon: Iconsax.notification,
              onTap: () => context.push(TAppRouter.dialogSnackbar),
            ),
            
            const SizedBox(height: TSizes.spaceBtwInputFields),
            
            _buildCategoryCard(
              context,
              title: 'Shimmers & Loaders',
              subtitle: 'Verify loading states and skeleton screens',
              icon: Iconsax.refresh,
              onTap: () => context.push(TAppRouter.shimmerLoader),
            ),
            
            const SizedBox(height: TSizes.defaultSpaceBtwSection),
            
            // Example of a reusable button directly here
            ReusableLoaderButton(
              text: 'Logout (Test Button)',
              fillColor: TColors.errorRed,
              textColor: Colors.white,
              onTap: () {
                ReusableSnackbars.successSnackBar(context: context, title: 'Logout tapped!');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: THelperFucntion.isDarkMode(context) ? TColors.darkGrey : TColors.lightGrey,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          border: Border.all(color: TColors.grey.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: TColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
              ),
              child: Icon(icon, color: TColors.primary, size: 30),
            ),
            const SizedBox(width: TSizes.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ),
            const Icon(Iconsax.arrow_right_3, size: 18),
          ],
        ),
      ),
    );
  }
}
