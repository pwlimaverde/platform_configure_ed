// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ComandosGerais {
  final bool stopServices;
  ComandosGerais({
    required this.stopServices,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stop_services': stopServices,
    };
  }

  factory ComandosGerais.fromMap(Map<String, dynamic> map) {
    return ComandosGerais(
      stopServices: (map['stop_services'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComandosGerais.fromJson(String source) => ComandosGerais.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ComandosGeral(stopServices: $stopServices)';

  @override
  bool operator ==(covariant ComandosGerais other) {
    if (identical(this, other)) return true;
  
    return 
      other.stopServices == stopServices;
  }

  @override
  int get hashCode => stopServices.hashCode;
}
