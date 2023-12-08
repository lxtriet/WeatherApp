import 'package:flutter/material.dart';

import 'colors.dart';

class Decorations {
  static BoxShadow commonShadow({
    Color? color,
    double? blurRadius,
    Offset? offset,
  }) {
    return BoxShadow(
      color: color ?? const Color.fromRGBO(30, 3, 13, 0.3),
      blurRadius: blurRadius ?? 8,
      offset: offset ?? const Offset(0, 4),
    );
  }

  static BoxShadow shadowA3Down() {
    return BoxShadow(
      color: AppColors.black.withOpacity(0.12),
      blurRadius: 30,
      spreadRadius: 0,
      offset: const Offset(0, 10),
    );
  }

  static BoxShadow shadowA1Down() {
    return BoxShadow(
      color: AppColors.black.withOpacity(0.14),
      blurRadius: 7,
      spreadRadius: 0,
      offset: const Offset(0, 3),
    );
  }

  static BoxShadow shadowA2Top() {
    return BoxShadow(
      color: AppColors.black.withOpacity(0.12),
      blurRadius: 14,
      spreadRadius: 0,
      offset: const Offset(0, -6),
    );
  }

  static BoxShadow shadowA2TopButton() {
    return BoxShadow(
      color: AppColors.black.withOpacity(0.12),
      blurRadius: 16,
      spreadRadius: 0,
      offset: const Offset(0, -4),
    );
  }


  static BoxShadow shadowA0Down() {
    return BoxShadow(
      color: AppColors.black.withOpacity(0.06),
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 3),
    );
  }

  static BoxShadow shadowA2Down() {
    return BoxShadow(
      color: AppColors.black.withOpacity(0.12),
      blurRadius: 14,
      spreadRadius: 0,
      offset: const Offset(0, 6),
    );
  }
}
