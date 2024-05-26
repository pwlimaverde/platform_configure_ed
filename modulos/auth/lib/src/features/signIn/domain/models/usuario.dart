// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Usuario {
  final String id;
  final String? nome;
  final String? email;
  Usuario({
    required this.id,
    this.nome,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: (map['id'] ?? '') as String,
      nome: map['nome'] != null ? map['nome'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Usuario(id: $id, nome: $nome, email: $email)';

  @override
  bool operator ==(covariant Usuario other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nome == nome &&
      other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ email.hashCode;
}
