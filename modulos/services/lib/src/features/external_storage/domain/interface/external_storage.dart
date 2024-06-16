import '../models/registro.dart';

abstract interface class ExternalStorage {
  Future<T> read<T>(
    Registro registro,
    bool isStream,
  );
  Future<void> write(Registro registro);
  Future<void> remove(Registro registro);
}
