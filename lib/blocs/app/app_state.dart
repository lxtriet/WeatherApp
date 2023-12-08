import 'package:equatable/equatable.dart';

import '../../enums/enums.dart';

class AppState extends Equatable {
  final Language? language;
  AppState({
    AppState? state,
    Language? language,
  }) : language = language ?? state?.language ?? Language.en;

  @override
  List<Object?> get props => [
        language,
      ];
}
