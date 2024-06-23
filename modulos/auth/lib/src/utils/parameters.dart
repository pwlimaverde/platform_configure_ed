import 'package:dependencies/dependencies.dart';

final class ParametrosId implements ParametersReturnResult {
  final String id;
  @override
  final AppError error;

  ParametrosId({
    required this.id,
    required this.error,
  });
}