import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double radius;
  final double? height;

  const RoundContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.height,
    this.radius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
