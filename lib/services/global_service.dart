import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class GlobalService extends GetxController {
  static GlobalService get instance => Get.find();

  late final Rx<int> _userIdFromServer;

  late final Rx<String> _userIpDevice;

  int get userIdFromServer => _userIdFromServer.value;

  String get userIpDevice => _userIpDevice.value;

  set userIdFromServer(int id) => _userIdFromServer(id);

  @override
  void onInit() {
    _userIdFromServer = Rx(0);
    _userIpDevice = Rx('');
    getIpDevice();
    super.onInit();
  }

  Future<void> getIpDevice() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    final String deviceId = androidDeviceInfo.id;
    _userIpDevice.value = deviceId;
  }
}
