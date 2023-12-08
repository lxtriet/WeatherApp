import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'route_arguments.dart';

class Routes {
  static String get splash => '/';

  static String get home => '/home';

  static getRoute(RouteSettings settings) {
    Widget widget;
    try {
      widget = GetIt.I.get<Widget>(instanceName: settings.name);
    } catch (e) {
      widget = Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Builder(
            builder: (context) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  '404 NOT FOUND',
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      );
    }

    if (settings.arguments is RouteArguments &&
        !(settings.arguments as RouteArguments).opaque) {
      RouteSettings newSettings = RouteSettings(
          name: settings.name,
          arguments: (settings.arguments as RouteArguments).data);
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, __, ___) => widget,
          settings: newSettings);
    }

    return CupertinoPageRoute(
      builder: (_) => widget,
      settings: settings,
    );
  }
}
