import 'package:get/get.dart';
import 'package:movie_spot/data/remote/app_client.dart';

class ClientModule {
  static Future<void> init() async {
    await Get.putAsync<AppClient>(
      () async => await AppClient.create(),
      permanent: true,
    );
  }
}
