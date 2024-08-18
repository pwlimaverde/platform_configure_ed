// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

final class GetIdentificacaoModel {
  final String identificacao;
  GetIdentificacaoModel({
    required this.identificacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identificacao': identificacao,
    };
  }

  factory GetIdentificacaoModel.fromMap(Map<String, dynamic> map) {
    return GetIdentificacaoModel(
      identificacao: (map['identificacao'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetIdentificacaoModel.fromJson(String source) => GetIdentificacaoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Identificacao do dispositivo: $identificacao';

  @override
  bool operator ==(covariant GetIdentificacaoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.identificacao == identificacao;
  }

  @override
  int get hashCode => identificacao.hashCode;
}
