import 'package:flutter_starter_kit/utils/barrel_files/utils_barrel.dart';
//This is an reusable badge that can be used in appbar to show widget
class ReusableAppBarBadge extends StatelessWidget {
  const ReusableAppBarBadge({
    super.key,
    required this.child, // Jo widgets andar show karne hain
    this.backgroundColor,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.all(7.0),
    this.onTap,
  });

  final Widget child;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          // Default color: primaryYellow with 10% opacity
          color: backgroundColor ?? TColors.primaryYellow.withOpacity(0.1),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}