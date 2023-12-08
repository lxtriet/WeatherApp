import 'package:flutter/material.dart';
import '../../resources/resources.dart';

abstract class AppDialog extends StatelessWidget {
  final EdgeInsets? padding;

  const AppDialog({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      backgroundColor: AppColors.santaWhite1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          width: 316,
          child: buildChild(context),
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context);
}
