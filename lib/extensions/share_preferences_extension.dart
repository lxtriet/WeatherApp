import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../enums/enums.dart';

extension SharedPreferencesExtension on SharedPreferences {
  Future setAppLanguage(Language language) {
    return setString(SharedPreferencesKey.languageCode, language.name);
  }

  Language get appLanguge {
    return getString(SharedPreferencesKey.languageCode).asLanguage();
  }
}
