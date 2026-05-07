import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/common/dialogs/reusable_dialogs.dart';
import 'package:flutter_starter_kit/common/snackbars/snackbar.dart';
import 'package:flutter_starter_kit/common/buttons/reusable_loader_button.dart';

class DialogSnackbarScreen extends StatelessWidget {
  const DialogSnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialogs & Snackbars')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECTION: SNACKBARS ---
            Text('Custom Snackbars', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
            
            ReusableLoaderButton(
              text: 'Success Snackbar',
              fillColor: Colors.green,
              textColor: Colors.white,
              onTap: () => ReusableSnackbars.successSnackBar(
                context: context,
                title: 'Operation Successful',
                message: 'Your data has been saved.',
              ),
            ),
            const SizedBox(height: TSizes.sm),
            
            ReusableLoaderButton(
              text: 'Error Snackbar',
              fillColor: Colors.red,
              textColor: Colors.white,
              onTap: () => ReusableSnackbars.errorSnackBar(
                context: context,
                title: 'Error Occurred',
                message: 'Something went wrong.',
              ),
            ),
            const SizedBox(height: TSizes.sm),
            
            ReusableLoaderButton(
              text: 'Warning Snackbar',
              fillColor: Colors.orange,
              textColor: Colors.white,
              onTap: () => ReusableSnackbars.warningSnackBar(
                context: context,
                title: 'Warning',
                message: 'Check your internet connection.',
              ),
            ),
            const SizedBox(height: TSizes.sm),
            
            ReusableLoaderButton(
              text: 'Custom Toast',
              fillColor: TColors.darkGrey,
              textColor: Colors.white,
              onTap: () => ReusableSnackbars.customToast(
                context: context,
                message: 'Hello! I am a toast.',
              ),
            ),
            
            const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
            
            // --- SECTION: DIALOGS ---
            Text('Reusable Dialogs', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TSizes.defaultMoreSpaceBtwItem),
            
            ReusableLoaderButton(
              text: 'Info Dialog',
              fillColor: TColors.primary,
              textColor: Colors.white,
              onTap: () => TDialogs.showInfoDialog(
                context: context,
                title: 'Information',
                content: 'This is an information dialog using the common components.',
              ),
            ),
            const SizedBox(height: TSizes.sm),
            
            ReusableLoaderButton(
              text: 'Confirmation Dialog',
              fillColor: TColors.secondary,
              textColor: Colors.white,
              onTap: () => TDialogs.showConfirmationDialog(
                context: context,
                title: 'Delete Item?',
                content: 'Are you sure you want to delete this item permanently?',
                onConfirm: () => ReusableSnackbars.successSnackBar(context: context, title: 'Deleted'),
              ),
            ),
            const SizedBox(height: TSizes.sm),
            
            ReusableLoaderButton(
              text: 'Loading Dialog',
              fillColor: TColors.primaryYellow,
              onTap: () {
                TDialogs.showLoadingDialog(context, 'Please wait...');
                Future.delayed(const Duration(seconds: 3), () => Navigator.pop(context));
              },
            ),
          ],
        ),
      ),
    );
  }
}
