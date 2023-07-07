import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkConnection() async {
  final result = await Connectivity().checkConnectivity();
  if (result == ConnectivityResult.none) {
    return false;
  }
  return true;
}
