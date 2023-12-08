import '../../core/core.dart';
import 'splash_command.dart';

class SplashBloc extends BaseBloc<NoState, SplashCommand> {
  SplashBloc();

  void initSplash() async {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => emitCommand(SplashStartMain()),
    );
  }
}
