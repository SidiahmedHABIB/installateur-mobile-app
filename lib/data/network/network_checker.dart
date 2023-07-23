import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkChecker {
  Future<bool> get isConnected => InternetConnectionChecker().hasConnection;
  // local checker
  //bool isConnected = true;
}
