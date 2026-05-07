import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/common/buttons/reusable_loader_button.dart';
import 'package:flutter_starter_kit/common/text_fields/custom_text_field.dart';

class WidgetsGalleryScreen extends StatefulWidget {
  const WidgetsGalleryScreen({super.key});

  @override
  State<WidgetsGalleryScreen> createState() => _WidgetsGalleryScreenState();
}

class _WidgetsGalleryScreenState extends State<WidgetsGalleryScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isBtnLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons & Fields')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECTION: BUTTONS ---
            Text('Reusable Buttons', style: Theme.of(context).textTheme.headlineSmall),

            const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
            
            ReusableLoaderButton(
              text: 'Primary Button',
              fillColor: TColors.primary,
              textColor: Colors.white,
              onTap: () {},
            ),
            const SizedBox(height: TSizes.sm),
            
            ReusableLoaderButton(
              text: 'Button with Icon',
              icon: Iconsax.send_1,
              fillColor: TColors.secondary,
              textColor: Colors.white,
              onTap: () {},
            ),
            const SizedBox(height: TSizes.sm),
            
            ReusableLoaderButton(
              text: 'Loading State Toggle',
              isLoading: _isBtnLoading,
              fillColor: TColors.primaryYellow,
              onTap: () async {
                setState(() => _isBtnLoading = true);
                await Future.delayed(const Duration(seconds: 2));
                setState(() => _isBtnLoading = false);
              },
            ),
            const SizedBox(height: TSizes.sm),
            
            ReusableLoaderButton(
              text: 'Border Button',
              isShowBorder: true,
              fillColor: Colors.transparent,
              textColor: TColors.primary,
              borderColor: TColors.primary,
              onTap: () {},
            ),
            
            const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
            
            // --- SECTION: TEXT FIELDS ---
            Text('Custom Text Fields', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
            
            CustomTextField(
              controller: _nameController,
              hintText: 'Enter your name',
              labelText: 'Full Name',
              prefix: const Icon(Iconsax.user),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            
            CustomTextField(
              controller: _passwordController,
              hintText: 'Enter password',
              labelText: 'Password',
              prefix: const Icon(Iconsax.lock),
              showPasswordHideButton: true,
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Search...',
              prefix: const Icon(Iconsax.search_normal),
            ),
            
            const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
            
            // --- SECTION: UTILS PREVIEW ---
            Text('Utility Helpers', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
            
            _buildUtilRow('Is Dark Mode:', THelperFucntion.isDarkMode(context).toString()),
            _buildUtilRow('Screen Width:', TDeviceUtils.getScreenWidth(context).toStringAsFixed(0)),
            _buildUtilRow('Screen Height:', TDeviceUtils.getScreenHeight(context).toStringAsFixed(0)),
            _buildUtilRow('Platform:', TDeviceUtils.isAndroid() ? 'Android' : (TDeviceUtils.isIOS() ? 'iOS' : 'Web/Other')),
          ],
        ),
      ),
    );
  }

  Widget _buildUtilRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(value, style: const TextStyle(color: TColors.primary)),
        ],
      ),
    );
  }
}
