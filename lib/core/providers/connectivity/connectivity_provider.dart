import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/connection/connectivity_service.dart';


final connectivityProvider = StreamProvider<ConnectivityResult>((ref){
  final connectivityService = ConnectivityService();
  return connectivityService.connectivityStream;
});