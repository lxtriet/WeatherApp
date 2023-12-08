import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/blocs.dart';
import 'enums/enums.dart';
import 'generated/l10n.dart';
import 'router/router.dart';

class App extends StatefulWidget {
  final AppBloc bloc;

  const App({Key? key, required this.bloc}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppBloc get bloc => widget.bloc;

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Language>(
        stream: bloc.languageStream,
        builder: (context, snapshot) {
          return _buildApp(locale: Language.getLocale(snapshot.data));
        });
  }

  Widget _buildApp({Locale? locale}) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      onGenerateRoute: (settings) => Routes.getRoute(settings),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
    );
  }
}
