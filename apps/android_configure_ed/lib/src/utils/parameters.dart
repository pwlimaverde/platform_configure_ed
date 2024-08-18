import 'package:dependencies/dependencies.dart';

final class ParametrosApelido implements ParametersReturnResult {
  final String apelido;
  @override
  final AppError error;

  ParametrosApelido({
    required this.apelido,
    required this.error,
  });
}