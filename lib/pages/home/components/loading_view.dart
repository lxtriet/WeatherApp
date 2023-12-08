import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../generated/l10n.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(color: Colors.white)),
        const SizedBox(width: 20),
        S.of(context).loading.text(
            fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)
      ],
    );
  }
}
