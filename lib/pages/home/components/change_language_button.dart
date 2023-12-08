import 'package:flutter/material.dart';

import '../../../blocs/blocs.dart';
import '../../../enums/enums.dart';

class ChangeLanguageButton extends StatefulWidget {
  final AppBloc appBloc;
  const ChangeLanguageButton(this.appBloc, {super.key});

  @override
  State<ChangeLanguageButton> createState() => _ChangeLanguageButtonState();
}

class _ChangeLanguageButtonState extends State<ChangeLanguageButton> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Language>(
        stream: widget.appBloc.languageStream,
        builder: (context, snapshot) {
          return DropdownButtonHideUnderline(
            child: DropdownButton<Language>(
              value: widget.appBloc.currentLanguage,
              icon: const SizedBox(),
              items: Language.values.map((Language item) {
                return DropdownMenuItem(
                  value: item,
                  child: item.icon().svg(width: 40),
                );
              }).toList(),
              onChanged: (Language? newValue) {
                if (newValue == null) return;
                widget.appBloc.changeLanguage(newValue);
              },
            ),
          );
        });
  }
}
