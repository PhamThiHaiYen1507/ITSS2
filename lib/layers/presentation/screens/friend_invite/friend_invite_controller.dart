import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/data/repository/user_repository_impl.dart';
import 'package:translate_app/layers/data/request/add_friend_request.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:translate_app/layers/domain/repository/users_repository.dart';

class FriendInviteController extends GetxController {
  final UsersRepository _usersRepository = UserRepositoryImpl();

  final Rx<List<UserInfoModel>> _users = Rx([]);
  @override
  void onInit() {
    _getFriendInvite();
    super.onInit();
  }

  Future<void> _getFriendInvite() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    final String deviceId = androidDeviceInfo.id;
    final res = await _usersRepository.getFriendInvite(deviceId);

    res.map(_users);
  }

  Future<void> acceptInvite(UserInfoModel user) async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    final String deviceId = androidDeviceInfo.id;
    await _usersRepository.acceptFriendRequest(
        AddFriendRequest(firstUserIp: deviceId, secondUserId: user.userId));

    _users.update((val) => val?.remove(user));
  }

  List<UserInfoModel> get users => _users.value;
}
