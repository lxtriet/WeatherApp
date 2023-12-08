import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final BoxDecoration? decoration;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;

  const CustomMaterialButton(
      {Key? key,
      required this.child,
      this.height,
      this.width,
      this.decoration,
      this.borderRadius,
      this.padding,
      this.margin,
      this.alignment,
      this.onTap,
      this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCircle = decoration?.shape == BoxShape.circle;
    return Container(
      margin: margin,
      constraints: constraints,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap?.call();
          },
          borderRadius: borderRadius ?? decoration?.borderRadius?.resolve(null),
          customBorder: isCircle ? const CircleBorder() : null,
          child: Ink(
            height: height,
            width: width,
            padding: padding,
            decoration: decoration ??
                BoxDecoration(
                  borderRadius: borderRadius,
                  color: Colors.transparent,
                ),
            child: alignment != null
                ? Stack(
                    children: [
                      Align(
                        alignment: alignment!,
                        child: child,
                      )
                    ],
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
