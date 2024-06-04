// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Dispositivo {
  final String id;
  final String nome;
  final String product;
  final String model;
  final String brand;
  Dispositivo({
    required this.id,
    required this.nome,
    required this.product,
    required this.model,
    required this.brand,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'product': product,
      'model': model,
      'brand': brand,
    };
  }

  factory Dispositivo.fromMap(Map<String, dynamic> map) {
    return Dispositivo(
      id: (map['id'] ?? '') as String,
      nome: (map['nome'] ?? '') as String,
      product: (map['product'] ?? '') as String,
      model: (map['model'] ?? '') as String,
      brand: (map['brand'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dispositivo.fromJson(String source) => Dispositivo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Dispositivo(id: $id, nome: $nome, product: $product, model: $model, brand: $brand)';
  }

  @override
  bool operator ==(covariant Dispositivo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nome == nome &&
      other.product == product &&
      other.model == model &&
      other.brand == brand;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nome.hashCode ^
      product.hashCode ^
      model.hashCode ^
      brand.hashCode;
  }
}
