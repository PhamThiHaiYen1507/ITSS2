import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  late final RxInt currentIndex;

  @override
  void onInit() {
    currentIndex = RxInt(0);
    super.onInit();
  }
}
