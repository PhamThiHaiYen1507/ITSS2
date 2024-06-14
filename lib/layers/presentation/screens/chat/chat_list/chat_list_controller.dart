import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/data/raw/room_data.dart';
import 'package:translate_app/layers/data/repository/user_repository_impl.dart';
import 'package:translate_app/layers/domain/entities/room_model.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:translate_app/layers/domain/repository/users_repository.dart';
import 'package:translate_app/services/global_service.dart';

class ChatListController extends GetxController {
  final UsersRepository _usersRepository = UserRepositoryImpl();

  final Rx<List<UserInfoModel>> _users = Rx([]);

  final GlobalService g = Get.find();

  final Rx<List<RoomModel>> _rooms = Rx([]);

  late DatabaseReference roomListRef =
      FirebaseDatabase.instance.ref('${g.userIdFromServer}').child('rooms');

  late DatabaseReference newRoomRef = roomListRef.push();

  @override
  void onInit() {
    _getRooms();
    _findAllFriends();
    super.onInit();
  }

  void _getRooms() {
    roomListRef.get().then(
      (value) {
        if (value.value is List) {
          _rooms.value = (value.value as List)
              .map((e) => RoomData.fromJson(Map.from(e)).toRoomModel())
              .toList();
        }
      },
    );
  }

  Future<void> _findAllFriends() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    final String deviceId = androidDeviceInfo.id;
    final res = await _usersRepository.findAllFriends(deviceId);

    res.map(_users);
  }

  List<RoomModel> get rooms => _rooms.value;

  List<UserInfoModel> get users => _users.value;
}
