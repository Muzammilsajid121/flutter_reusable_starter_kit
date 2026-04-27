import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class TReusableRefreshIndicator extends StatelessWidget {
  const TReusableRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.color,
    this.backgroundColor,
  });

  final Widget child;
  final Future<void> Function() onRefresh;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: color ?? TColors.primaryYellow,
      backgroundColor: backgroundColor ?? TColors.widgetbgpurewhite,
      strokeWidth: 3,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
