import 'package:get/get.dart';
import 'package:movie_spot/data/controllers/network_controller.dart';
import 'package:movie_spot/di/modules/client_module.dart';
import 'package:movie_spot/di/modules/repositories_module.dart';

class DependencyInjection {
  static Future<void> init() async {
    Get.put<NetworkController>(NetworkController(), permanent: true);

    await ClientModule.init();
    RepositoriesModule.init();
  }
}
