// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'dispositivo.dart';

class Licenca {
  final String id;
  final DateTime? dataAtivacao;
  final DateTime? dataExpiracao;
  final int? quantDispositivo;
  List<Dispositivo> dispositivosAtivos;
  Licenca({
    required this.id,
    this.dataAtivacao,
    this.dataExpiracao,
    this.quantDispositivo,
    List<Dispositivo>? dispositivosAtivos,
  }) : dispositivosAtivos = dispositivosAtivos ?? <Dispositivo>[];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'data_ativacao': dataAtivacao?.millisecondsSinceEpoch,
      'data_expiracao': dataExpiracao?.millisecondsSinceEpoch,
      'quant_dispositivo': quantDispositivo,
      'dispositivos_ativos': dispositivosAtivos.map((x) => x.toMap()).toList(),
    };
  }

  factory Licenca.fromMap(Map<String, dynamic> map) {
    return Licenca(
      id: (map['id'] ?? '') as String,
      dataAtivacao: map['data_ativacao'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['data_ativacao'] ?? 0) as int)
          : null,
      dataExpiracao: map['data_expiracao'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (map['data_expiracao'] ?? 0) as int)
          : null,
      quantDispositivo: map['quant_dispositivo'] != null
          ? map['quant_dispositivo'] as int
          : null,
      dispositivosAtivos: map['dispositivos_ativos'] != null
          ? List<Dispositivo>.from(
              (map['dispositivos_ativos'] as List<int>).map<Dispositivo?>(
                (x) => Dispositivo.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Licenca.fromJson(String source) =>
      Licenca.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Licenca(id: $id, dataAtivacao: $dataAtivacao, dataExpiracao: $dataExpiracao, quantDispositivo: $quantDispositivo, dispositivosAtivos: $dispositivosAtivos)';
  }

  @override
  bool operator ==(covariant Licenca other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.dataAtivacao == dataAtivacao &&
        other.dataExpiracao == dataExpiracao &&
        other.quantDispositivo == quantDispositivo &&
        listEquals(other.dispositivosAtivos, dispositivosAtivos);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dataAtivacao.hashCode ^
        dataExpiracao.hashCode ^
        quantDispositivo.hashCode ^
        dispositivosAtivos.hashCode;
  }
}
