import 'package:connectivity_plus/connectivity_plus.dart';

///This class contains the logic for checking the network connection
class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();

  factory ConnectivityService() {
    return _instance;
  }

  ConnectivityService._internal();

  // It returns a stream of connection status that emits a list of ConnectivityResult values.
  Stream<ConnectivityResult> get connectivityStream {
    final connectivity = Connectivity();
    return connectivity.onConnectivityChanged.map((resultList) {
      // Returns the first item in the list, which represents the most recent connection status.
      return resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
    });
  }

  // Modify to get the first value of the list.
  Future<ConnectivityResult> checkConnectivity() async {
    final connectivity = Connectivity();
    final resultList = await connectivity.checkConnectivity(); //It returns a list.
    return resultList.isNotEmpty ? resultList.first : ConnectivityResult.none; //Get the first item of the list.
  }
}