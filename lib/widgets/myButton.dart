import 'package:flutter/material.dart';
import 'package:serener/widgets/myColor.dart';

class myButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color? color;
  final Alignment? alignment;
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxShape? boxShape;
  final List<BoxShadow>? boxshadow;
  final bool? status;

  const myButton(
      {super.key,
      this.status,
      this.onTap,
      this.color,
      this.alignment,
      this.height,
      this.width,
      this.boxShape,
      this.boxshadow,
      required this.child,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Palette.kBackgroundColor),
          color: color,
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
        ),
        child: Center(child: child),
      ),
    );
  }
}

class myButton2 extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color? color;
  final Alignment? alignment;
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxShape? boxShape;
  final List<BoxShadow>? boxshadow;

  const myButton2(
      {super.key,
      this.onTap,
      this.color,
      this.alignment,
      this.height,
      this.width,
      this.boxShape,
      this.boxshadow,
      required this.child,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 5,
                color: Color(0xff000000).withOpacity(0.3),
              )
            ]),
        child: Center(child: child),
      ),
    );
  }
}
