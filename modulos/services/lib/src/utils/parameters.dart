import 'package:dependencies_module/dependencies_module.dart';
final class ParametrosFirebaseStorage implements ParametersReturnResult {
  final FirebaseFirestore instanceFirebase;
  @override
  final AppError error;

  ParametrosFirebaseStorage({
    required this.instanceFirebase,
    required this.error,
  });
}

final class ParametrosFirebaseInit implements ParametersReturnResult {
  final FirebaseOptions options;
  @override
  final AppError error;

  ParametrosFirebaseInit({
    required this.options,
    required this.error,
  });
}
