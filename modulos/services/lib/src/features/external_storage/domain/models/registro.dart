
class Registro {
  final String colecao;
  final String documento;
  final Registro? subColecao;
  final Map<String, dynamic>? dados;
  Registro({
    required this.colecao,
    required this.documento,
    this.subColecao,
    this.dados,
  });

  Registro copyWith({
    String? colecao,
    String? documento,
    Registro? subColecao,
    Map<String, dynamic>? dados,
  }) {
    return Registro(
      colecao: colecao ?? this.colecao,
      documento: documento ?? this.documento,
      subColecao: subColecao ?? this.subColecao,
      dados: dados ?? this.dados,
    );
  }
}
