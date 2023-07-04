import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityRepository {
  Future<bool> checkConnection() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
