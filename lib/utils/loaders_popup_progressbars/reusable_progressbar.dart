import 'package:flutter/material.dart';

class ReusableProgressBar extends StatelessWidget {
  const ReusableProgressBar({
    super.key,

    /// Required
    required this.value, // 0.0 → 1.0
    /// Optional (with defaults)
    this.height = 12,
    this.radius = 10,
    this.fillColor = const Color(0xFFFFC107), // default yellow
    this.backgroundColor = const Color(0xFFEFEFEF),
  });

  final double value;
  final double height;
  final double radius;
  final Color fillColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: LinearProgressIndicator(
        value: value.clamp(0.0, 1.0), // safety
        minHeight: height,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(fillColor),
      ),
    );
  }
}