
import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
import 'package:flutter_starter_kit/utils/loaders_popup_progressbars/circular_loader.dart';
//--This is an reusable button that can show loading during some precoess and can show icon or image
class ReusableLoaderButton extends StatelessWidget {
  const ReusableLoaderButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 56,
    this.width = double.infinity,
    this.borderRadius = 20,
    this.horizontalPadding = 10,
    this.fillColor = const Color(0xffF8F9FA),
    this.textColor = Colors.black,
    this.isShowBorder = false,
    this.borderColor,
    this.imageHeight = 24,
    this.imageWidth = 24,
    this.icon,
    this.imagePath,
    this.spacingBetweenTextImage = 12.0,
    this.isImageIconOnLeft = false,
    this.gradient,
    this.fontSize = 15,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final double imageHeight;
  final double imageWidth;
  final double horizontalPadding;
  final double borderRadius;
  final Color fillColor;
  final Color textColor;
  final double fontSize;
  final bool isShowBorder;
  final Color? borderColor;
  final IconData? icon;
  final String? imagePath;
  final double spacingBetweenTextImage;
  final bool isImageIconOnLeft;
  final Gradient? gradient;
  final bool isLoading; // Loading state check karne ke liye

  @override
  Widget build(BuildContext context) {
    final defaultBorderColor = const Color(0xffD2C5AC).withValues(alpha: 0.4);

    return InkWell(
      // Agar loading ho rahi hai to onTap null kar do (Disable button)
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Opacity(
        // Loading ke waqt button ko thora sa fade 
        opacity: isLoading ? 0.8 : 1.0,
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 6.0),
          decoration: BoxDecoration(
            color: gradient != null ? null : fillColor,
            gradient: gradient,
            borderRadius: BorderRadius.circular(borderRadius),
            border: isShowBorder 
                ? Border.all(color: borderColor ?? defaultBorderColor) 
                : null,
          ),
          child: Center(
            child: isLoading
                ? TCircularLoader(
                    size: 20, 
                    foregroundColor: textColor, 
                    backgroundColor: Colors.transparent,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: isImageIconOnLeft 
                        ? [
                            if (icon != null) Icon(icon, color: textColor),
                            if (imagePath != null && icon == null)
                              Image.asset(imagePath!, height: imageHeight, width: imageWidth, color: textColor),
                            if (icon != null || imagePath != null) SizedBox(width: spacingBetweenTextImage),
                            Text(
                              text,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                    fontSize: fontSize,
                                  ),
                            ),
                          ]
                        : [
                            Text(
                              text,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                    fontSize: fontSize,
                                  ),
                            ),
                            if (icon != null || imagePath != null) SizedBox(width: spacingBetweenTextImage),
                            if (icon != null) Icon(icon, color: textColor),
                            if (imagePath != null && icon == null)
                              Image.asset(imagePath!, height: imageHeight, width: imageWidth, color: textColor),
                          ],
                  ),
          ),
        ),
      ),
    );
  }
}


//usage:
// ReusableLoaderButton(
//   text: 'Submit',
//   onTap: () { print('Button tapped!'); },
//   isLoading: true, // Show loading state
// ),