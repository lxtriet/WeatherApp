import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';
import '../../enums/enums.dart';
import '../../extensions/extensions.dart';
import 'app_state.dart';

class AppBloc extends BaseBloc<AppState, NoCommand> {
  late final SharedPreferences _prefs;

  Stream<Language> get languageStream => stateStream
      .where((event) => event.language != null)
      .map((event) => event.language!)
      .distinct();

  AppBloc(this._prefs) {
    initApp();
  }

  Future<void> initApp() async {
    emit(AppState(
      state: state,
      language: _prefs.appLanguge,
    ));
  }

  Future<void> changeLanguage(Language language) async {
    await _prefs.setAppLanguage(language);
    emit(AppState(
      language: language,
      state: state,
    ));
  }

  Language get currentLanguage => _prefs.appLanguge;
}
