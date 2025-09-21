import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer ({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.showborder = true,
    this.backgroundColor = Colors.white,
    this.radius = TSizes.cardRadiusLg,
    this.padding,
    this.borderColor = Colors.grey
  });

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showborder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showborder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
