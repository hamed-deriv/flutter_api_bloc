import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class BaseConnectivityService {
  late final Connectivity connectivity;

  late final StreamController<ConnectivityResult> connectivityStream;
}
