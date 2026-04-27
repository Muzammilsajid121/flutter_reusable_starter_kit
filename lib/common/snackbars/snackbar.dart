import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';

class ReusableSnackbars {
  //* SnackBar ko manually hidee
  static void hideSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  //* Custom Toast 
  static void customToast({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperFucntion.isDarkMode(context)
                ? TColors.darkGrey.withValues(alpha: 0.9)
                : TColors.grey.withValues(alpha: 0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  //* Success SnackBar
  static void successSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 1,
  }) {
    _showNativeSnackBar(
      context: context,
      title: title,
      message: message,
      backgroundColor: TColors.primary,
      icon: const Icon(Iconsax.check, color: Colors.white),
      duration: duration,
    );
  }

  //* Warning SnackBar
  static void warningSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    _showNativeSnackBar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.orange,
      icon: const Icon(Iconsax.warning_2, color: Colors.white),
    );
  }

  //* Error SnackBar
  static void errorSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    _showNativeSnackBar(
      context: context,
      title: title,
      message: message,
      backgroundColor: Colors.red.shade600,
      icon: const Icon(Iconsax.warning_2, color: Colors.white),
    );
  }

  //*Private Helper Method: 
  static void _showNativeSnackBar({
    required BuildContext context,
    required String title,
    required String message,
    required Color backgroundColor,
    required Widget icon,
    int duration = 1,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            icon,
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  if (message.isNotEmpty)
                    Text(message, style: const TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: duration),
        behavior: SnackBarBehavior.floating, // Isse snackbar thora upar utha hua dikhta hai
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

}