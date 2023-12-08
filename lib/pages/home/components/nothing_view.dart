import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../generated/l10n.dart';

class NothingView extends StatelessWidget {
  const NothingView({super.key});

  @override
  Widget build(BuildContext context) {
    return S
        .of(context)
        .city_or_zipcode_invalid
        .text(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white);
  }
}
