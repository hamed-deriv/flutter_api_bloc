import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter_api_bloc/services/base_connectivity_service.dart';

class ConnectivityService implements BaseConnectivityService {
  @override
  late final Connectivity connectivity;

  @override
  late final StreamController<ConnectivityResult> connectivityStream;

  ConnectivityService() {
    connectivity = Connectivity();
    connectivityStream = StreamController<ConnectivityResult>();

    connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) => connectivityStream.add(result));
  }
}
