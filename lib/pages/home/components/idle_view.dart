import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../generated/l10n.dart';

class IdleView extends StatelessWidget {
  const IdleView({super.key});

  @override
  Widget build(BuildContext context) {
    return S
        .of(context)
        .welcome
        .text(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white);
  }
}
