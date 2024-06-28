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

final class ParametrosNovoUser implements ParametersReturnResult {
  final String id;
  final String nome;
  final String email;
  @override
  final AppError error;

  ParametrosNovoUser({
    required this.id,
    required this.nome,
    required this.email,
    required this.error,
  });
}