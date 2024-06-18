import 'package:either_dart/either.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:translate_app/core/exceptions/api_exception.dart';
import 'package:translate_app/core/typedef/typedef.dart';
import 'package:translate_app/layers/data/raw/message_data.dart';
import 'package:translate_app/layers/data/raw/room_data.dart';
import 'package:translate_app/layers/domain/entities/message_model.dart';
import 'package:translate_app/layers/domain/entities/room_model.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:translate_app/layers/domain/repository/chat_repository.dart';
import 'package:uuid/uuid.dart';

class ChatRepositoryImpl implements ChatRepository {
  @override
  Future<ApiResponseData<List<RoomModel>>> getRooms(
      {required int userId}) async {
    try {
      DatabaseReference roomListRef = FirebaseDatabase.instance.ref('rooms');

      final data = await roomListRef.get();

      return Right(data.children
          .map((e) {
            final roomData = RoomData.fromJson(Map.from(e.value as Map));

            return RoomModel(
                roomId: roomData.roomId ?? const Uuid().v4(),
                friendInfo: roomData.userInRoom
                        ?.firstWhereOrNull(
                            (element) => element.userId != userId)
                        ?.toUserInfoModel() ??
                    UserInfoModel.empty(),
                userIds: roomData.userInRoom
                        ?.map((e) => e.userId)
                        .whereType<int>()
                        .toList() ??
                    []);
          })
          .where((element) => element.userIds.contains(userId))
          .toList());
    } catch (e) {
      return Left(ApiException());
    }
  }

  @override
  Future<ApiResponseData<RoomModel>> createRoom(
      {required UserInfoModel myInfo,
      required UserInfoModel friendInfo}) async {
    try {
      DatabaseReference roomListRef = FirebaseDatabase.instance.ref('rooms');

      final room = RoomData(roomId: const Uuid().v4(), userInRoom: [
        myInfo.toUserInfoData(),
        friendInfo.toUserInfoData(),
      ]);

      await roomListRef.push().set(room.toJson());

      return Right(RoomModel(
          roomId: room.roomId ?? const Uuid().v4(),
          friendInfo: friendInfo,
          userIds: [myInfo.userId, friendInfo.userId]));
    } catch (e) {
      return Left(ApiException());
    }
  }

  @override
  Future<ApiResponseData<List<MessageModel>>> getMessages(
      {required String roomId}) async {
    try {
      DatabaseReference messagesListRef =
          FirebaseDatabase.instance.ref('messages').child(roomId);

      final data = await messagesListRef.get();

      return Right(data.children
          .map((e) =>
              MessageData.fromJson(Map.from(e.value as Map)).toMessageModel())
          .toList());
    } catch (e) {
      return Left(ApiException());
    }
  }

  @override
  Future<ApiResponseData<bool>> sendMessage(
      {required String roomId, required MessageModel message}) async {
    try {
      DatabaseReference messagesListRef =
          FirebaseDatabase.instance.ref('messages').child(roomId);

      await messagesListRef.push().set(message.toJson());

      return const Right(true);
    } catch (e) {
      return Left(ApiException());
    }
  }
}
