import 'package:flutter/material.dart';

/// A circular loader widget with customizable size, stroke, and colors.
class TCircularLoader extends StatelessWidget {
  const TCircularLoader({
    super.key,
    this.foregroundColor = const Color(0xFFF9C323),
    this.backgroundColor, // Isay optional hi rehne dein
    this.size = 20.0,
    this.strokeWidth = 2.0,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      // Decoration hata di taake round container nazar na aaye
      decoration: backgroundColor != null 
          ? BoxDecoration(color: backgroundColor, shape: BoxShape.circle) 
          : null, 
      child: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            color: foregroundColor,
            strokeWidth: strokeWidth,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
