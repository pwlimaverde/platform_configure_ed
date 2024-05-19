import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/interface/external_storage.dart';
import '../../domain/models/registro.dart';

class FirebaseExternalStorage implements ExternalStorage {
  final FirebaseFirestore instanceFirebase;

  FirebaseExternalStorage({required this.instanceFirebase});

  @override
  Future<T> read<T>(
    Registro registro,
    bool isStream,
  ) async {
    try {
      var caminho =
          instanceFirebase.collection(registro.colecao).doc(registro.documento);

      var subData = registro.subColecao;
      while (subData != null) {
        caminho = caminho.collection(subData.colecao).doc(subData.documento);
        subData = subData.subColecao;
      }
      if (isStream) {
        final snapshot = caminho.snapshots();
        final data = snapshot.map((data) => data.data() ?? <String, dynamic>{});
        return data as T;
      } else {
        final snapshot = await caminho.get();
        final data = snapshot.data() ?? <String, dynamic>{};
        return data as T;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> remove(Registro registro) async {
    try {
      var caminho =
          instanceFirebase.collection(registro.colecao).doc(registro.documento);

      var subData = registro.subColecao;
      while (subData != null) {
        caminho = caminho.collection(subData.colecao).doc(subData.documento);
        subData = subData.subColecao;
      }

      await caminho.delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> write(Registro registro) async {
    try {
      var caminho =
          instanceFirebase.collection(registro.colecao).doc(registro.documento);
      if (registro.dados != null) {
        caminho.set(registro.dados!);
      }

      var subData = registro.subColecao;
      while (subData != null) {
        caminho = caminho.collection(subData.colecao).doc(subData.documento);
        if (subData.dados != null) {
          caminho.set(subData.dados!);
        }
        subData = subData.subColecao;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
