import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/widgets.dart';

extension TextStyleExtensions on String {
  TextStyle? style(
      {Color? color,
      double fontSize = 12,
      double height = 1.2,
      double? letterSpacing,
      FontWeight fontWeight = FontWeight.w500,
      TextStyle? style,
      List<Shadow>? shadows}) {
    return GoogleFonts.arimo(
            fontSize: fontSize,
            height: height,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            shadows: shadows,
            color: color)
        .merge(style);
  }

  TextExtCustomize text(
      {Color? color,
      TextStyle? textStyle,
      double fontSize = 12,
      double height = 1.2,
      FontWeight fontWeight = FontWeight.w500,
      TextAlign? textAlign,
      TextOverflow? overflow,
      List<Shadow>? shadows,
      TextStyleExtConfig? config,
      int? maxLines}) {
    return TextExtCustomize(
      this,
      config: config ??
          TextStyleExtConfig(
              textAlign: textAlign, overflow: overflow, maxLines: maxLines),
      style: style(
          fontSize: fontSize,
          height: height,
          color: color,
          style: textStyle,
          fontWeight: fontWeight,
          shadows: shadows),
    );
  }

  TextSpan span(
      {Color? color,
      double fontSize = 12,
      double height = 1.2,
      TextStyle? textStyle,
      List<TextSpan>? child,
      List<Shadow>? shadows,
      FontWeight fontWeight = FontWeight.w500,
      GestureRecognizer? recognizer}) {
    return TextSpan(
      text: this,
      children: child,
      recognizer: recognizer,
      style: style(
          fontSize: fontSize,
          height: height,
          color: color,
          style: textStyle,
          fontWeight: fontWeight,
          shadows: shadows),
    );
  }
}
