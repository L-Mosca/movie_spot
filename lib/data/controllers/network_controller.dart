import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  var isConnected = false.obs;

  @override
  void onInit() async {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectivityStatus);
  }

  void _updateConnectivityStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // Mobile network available
      isConnected.value = true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // Wifi network available
      isConnected.value = true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // No available network types
      isConnected.value = false;
    }
  }

  bool get connectionStatus => isConnected.value;
}

extension ConnectivityCheck on BuildContext {
  bool get isConnected => Get.find<NetworkController>().connectionStatus;
}
