import 'package:flutter_riverpod/flutter_riverpod.dart';


final connectivityProvider = StreamProvider<ConnectivityResult>((ref){
  final connectivityService = ConnectivityService();
  return connectivityService.connectivityStream;
});