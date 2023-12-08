import '../core.dart';

class Result<T> {
  final bool isSuccess;
  final AppError? error;
  final T? item;
  Result({
    required this.isSuccess,
    this.error,
    this.item,
  });
}
