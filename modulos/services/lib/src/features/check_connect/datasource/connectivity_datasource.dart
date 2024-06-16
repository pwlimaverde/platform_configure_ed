import 'dart:async';
import 'package:dependencies/dependencies.dart';

import '../../../utils/typedefs.dart';


///Datasources
final class ConnectivityDatasource
    implements Datasource<Stream<ConnectStatus>> {
  final Connectivity connectivity;

  ConnectivityDatasource(this.connectivity);

  @override
  Future<Stream<ConnectStatus>> call(
    NoParams parameters,
  ) async {
    try {
      final subscription = connectivity.onConnectivityChanged;
      final result = subscription.map((event) {
        if (event.contains(ConnectivityResult.none)) {
          return (connect: false, typeConect: "none");
        } else {
          final typeConect = event.contains(ConnectivityResult.wifi)
              ? "wifi"
              : event.contains(ConnectivityResult.mobile)
                  ? "moble"
                  : event.contains(ConnectivityResult.ethernet)
                      ? "ethernet"
                      : "none";
          return (connect: true, typeConect: typeConect);
        }
      });
      return result;
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
