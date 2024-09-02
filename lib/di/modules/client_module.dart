import 'package:get/get.dart';
import 'package:movie_spot/data/remote/app_client.dart';

class ClientModule {
  static void init() {
    Get.put<AppClient>(AppClient(), permanent: true);
  }
}
