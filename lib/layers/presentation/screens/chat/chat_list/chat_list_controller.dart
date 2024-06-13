import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/data/raw/room_data.dart';
import 'package:translate_app/layers/domain/entities/room_model.dart';
import 'package:translate_app/services/global_service.dart';

class ChatListController extends GetxController {
  final GlobalService g = Get.find();

  final Rx<List<RoomModel>> _rooms = Rx([]);

  late DatabaseReference roomListRef =
      FirebaseDatabase.instance.ref('${g.userIdFromServer}').child('rooms');
  late DatabaseReference newRoomRef = roomListRef.push();

  @override
  void onInit() {
    _getRooms();
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

  List<RoomModel> get rooms => _rooms.value;
}
