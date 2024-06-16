// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ComandosMic {
  final bool record;
  final bool debug;
  final int timeStart;
  ComandosMic({
    required this.record,
    required this.debug,
    required this.timeStart,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'record': record,
      'debug': debug,
      'timeStart': timeStart,
    };
  }

  factory ComandosMic.fromMap(Map<String, dynamic> map) {
    return ComandosMic(
      record: (map['record'] ?? false) as bool,
      debug: (map['debug'] ?? false) as bool,
      timeStart: (map['timeStart'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComandosMic.fromJson(String source) => ComandosMic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ComandosMic(record: $record, debug: $debug, timeStart: $timeStart)';

  @override
  bool operator ==(covariant ComandosMic other) {
    if (identical(this, other)) return true;
  
    return 
      other.record == record &&
      other.debug == debug &&
      other.timeStart == timeStart;
  }

  @override
  int get hashCode => record.hashCode ^ debug.hashCode ^ timeStart.hashCode;
}
