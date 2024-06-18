import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/data/repository/user_repository_impl.dart';
import 'package:translate_app/layers/data/request/add_friend_request.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:translate_app/layers/domain/repository/users_repository.dart';
import 'package:translate_app/utils/app_logger/app_logger.dart';

class MatchFriendController extends GetxController {
  final UsersRepository _usersRepository = UserRepositoryImpl();

  final Rx<List<UserInfoModel>> _users = Rx([]);

  @override
  void onInit() {
    _getUsersInfo();
    super.onInit();
  }

  Future<void> _getUsersInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    final String deviceId = androidDeviceInfo.id;
    final res = await _usersRepository.getUsersInfo(deviceId);

    res.map(_users);
    _users.update((val) => val?.add(UserInfoModel(
        userId: -1,
        name: '',
        age: 0,
        appropriatenessPercent: 0,
        favoritesOther: [],
        favoritesOverlap: [],
        sent: false)));
  }

  Future<void> addFriend(UserInfoModel userAdd) async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    final String deviceId = androidDeviceInfo.id;
    final res = await _usersRepository.addFriend(
        AddFriendRequest(firstUserIp: deviceId, secondUserId: userAdd.userId));
    if (res.right.result == true) {}
    _users.update((val) => val
        ?.firstWhereOrNull((element) => element.userId == userAdd.userId)
        ?.sent = true);
    await Future.delayed(const Duration(seconds: 3));
    _users.update((val) => val?.remove(userAdd));
  }

  List<UserInfoModel> get users => _users.value;
}
