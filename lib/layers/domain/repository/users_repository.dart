import 'package:translate_app/core/typedef/typedef.dart';
import 'package:translate_app/layers/data/raw/result_data.dart';
import 'package:translate_app/layers/data/request/add_friend_request.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';

abstract class UsersRepository {
  Future<ApiResponseData<List<UserInfoModel>?>> getUsersInfo(String userIp);
  Future<ApiResponseData<ResultData>> addFriend(AddFriendRequest request);
  Future<ApiResponseData<ResultData>> acceptFriendRequest(
      AddFriendRequest request);
  Future<ApiResponseData<List<UserInfoModel>?>> getFriendInvite(String userIp);
  Future<ApiResponseData<List<UserInfoModel>?>> findAllFriends(String userIp);
}
