import 'package:get/get.dart';

class GlobalService extends GetxController {
  static GlobalService get instance => Get.find();
  late final Rx<int> _userIdFromServer;

  int get userIdFromServer => _userIdFromServer.value;
  @override
  void onInit() {
    _userIdFromServer = Rx(0);
    super.onInit();
  }
}
