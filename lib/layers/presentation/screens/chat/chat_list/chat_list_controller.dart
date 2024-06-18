import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/data/raw/user_info_data.dart';
import 'package:translate_app/layers/data/repository/chat_repository_impl.dart';
import 'package:translate_app/layers/data/repository/user_repository_impl.dart';
import 'package:translate_app/layers/domain/entities/room_model.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:translate_app/layers/domain/repository/chat_repository.dart';
import 'package:translate_app/layers/domain/repository/users_repository.dart';
import 'package:translate_app/layers/presentation/screens/chat/chat_detail_screen.dart';
import 'package:translate_app/services/global_service.dart';

class ChatListController extends GetxController {
  final UsersRepository _usersRepository = UserRepositoryImpl();

  final ChatRepository _chatRepository = ChatRepositoryImpl();

  final Rx<List<UserInfoModel>> _users = Rx([]);

  final GlobalService g = Get.find();

  final Rx<List<RoomModel>> _rooms = Rx([]);

  @override
  void onInit() {
    _getRooms();
    _findAllFriends();
    super.onInit();
  }

  Future<void> _getRooms() async {
    _rooms.value =
        (await _chatRepository.getRooms(userId: g.userIdFromServer)).right;
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
