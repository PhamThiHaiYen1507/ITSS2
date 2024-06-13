import 'package:get/get.dart';
import 'package:translate_app/services/global_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalService());
  }
}
