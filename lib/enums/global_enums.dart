import 'dart:ui';

import '../gen/assets.gen.dart';

enum Language {
  vi,
  en;

  static Locale getLocale(Language? language) {
    switch (language) {
      case Language.vi:
        return Locale(Language.vi.name, 'VN');
      default:
        return Locale(Language.en.name, 'US');
    }
  }

  SvgGenImage icon() {
    switch (this) {
      case Language.vi:
        return Assets.images.flagVn;
      default:
        return Assets.images.flagUs;
    }
  }
}

extension LanguageExtension on String? {
  Language asLanguage() {
    switch (this) {
      case 'vi':
        return Language.vi;
      default:
        return Language.en;
    }
  }
}
