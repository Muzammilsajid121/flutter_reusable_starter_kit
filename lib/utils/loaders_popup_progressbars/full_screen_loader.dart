import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/utils/loaders_popup_progressbars/animation_loader.dart'; // Apne barrel files ka sahi path check karlein

class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// Bina GetX ke, humein 'context' pass karna zaroori hai.
  static void openLoadingDialog(BuildContext context, String text, String animation) {
    showDialog(
      context: context,
      barrierDismissible: false, // Bahar tap karne se dialog band nahi hoga
      builder: (_) => PopScope(
        canPop: false, // Back button se dialog band nahi hoga
        child: Container(
          color: THelperFucntion.isDarkMode(context)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView( // Overflow se bachne ke liye
            child: Column(
              children: [
                const SizedBox(height: 250),
                TAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Stop the currently running dialog.
  /// Navigator.of(context).pop() use karein dialog close karne ke liye.
  static void stopLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}