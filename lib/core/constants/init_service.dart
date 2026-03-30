import 'package:get/get.dart';
import '../config/env_config.dart';

class InitService extends GetxService {
  Future<InitService> init() async {
    await EnvConfig.load();

    return this;
  }
}
