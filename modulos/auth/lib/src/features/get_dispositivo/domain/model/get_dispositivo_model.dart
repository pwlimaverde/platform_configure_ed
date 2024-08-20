import 'package:collection/collection.dart';

class GetDispositivoModel {
  final Map<String, dynamic> data;
  GetDispositivoModel({
    required this.data,
  });


  @override
  String toString() => 'GetDispositivoModel(data: $data)';

  @override
  bool operator ==(covariant GetDispositivoModel other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;
  
    return 
      mapEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
