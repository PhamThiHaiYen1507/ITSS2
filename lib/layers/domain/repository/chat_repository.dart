import 'package:translate_app/core/typedef/typedef.dart';
import 'package:translate_app/layers/domain/entities/message_model.dart';
import 'package:translate_app/layers/domain/entities/room_model.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';

abstract class ChatRepository {
  Future<ApiResponseData<List<RoomModel>>> getRooms({required int userId});

  Future<ApiResponseData<RoomModel>> createRoom(
      {required UserInfoModel myInfo, required UserInfoModel friendInfo});

  Future<ApiResponseData<List<MessageModel>>> getMessages(
      {required String roomId});

  Future<ApiResponseData<bool>> sendMessage(
      {required String roomId, required MessageModel message});
}
