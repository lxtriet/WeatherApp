import 'package:flutter/material.dart';

import '../../blocs/blocs.dart';
import '../../core/core.dart';
import '../../resources/resources.dart';
import '../../router/router.dart';
import '../../utils/utils.dart';

class SplashPage extends StatefulWidget {
  final SplashBloc bloc;

  const SplashPage(this.bloc, {super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashBloc> {
  @override
  SplashBloc get bloc => widget.bloc;

  @override
  void commandListener(BlocCommand command) {
    if (command is SplashStartMain) {
      _startMain();
      return;
    }
    super.commandListener(command);
  }

  @override
  void initState() {
    bloc.initSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
          ),
          clipBehavior: Clip.antiAlias,
          child: AppConfig.instance.environment.appIcon.image(width: 100),
        ),
      ),
    );
  }

  void _startMain() {
    Navigator.pushReplacementNamed(context, Routes.home);
  }
}
