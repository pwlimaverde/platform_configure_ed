
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
}
