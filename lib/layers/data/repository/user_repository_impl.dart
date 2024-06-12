import 'package:either_dart/either.dart';
import 'package:translate_app/core/exceptions/api_exception.dart';
import 'package:translate_app/core/typedef/typedef.dart';
import 'package:translate_app/layers/data/raw/result_data.dart';
import 'package:translate_app/layers/data/request/add_friend_request.dart';
import 'package:translate_app/layers/data/source/api_client.dart';
import 'package:translate_app/layers/domain/entities/user_info_model.dart';
import 'package:translate_app/layers/domain/repository/users_repository.dart';
import 'package:translate_app/utils/app_logger/app_logger.dart';

class UserRepositoryImpl implements UsersRepository {
  final ApiClient _client = ApiClientImpl();

  @override
  Future<ApiResponseData<List<UserInfoModel>>> getUsersInfo(
      String userIp) async {
    try {
      final res = await _client.getUserInfo(userIp);

      return Right(res?.map((e) => e.toUserInfoModel()).toList() ?? []);
    } on Exception catch (_) {
      return Left(ApiException());
    }
  }

  @override
  Future<ApiResponseData<ResultData>> addFriend(
      AddFriendRequest request) async {
    try {
      final res = await _client.addPriend(request);
      return Right(res);
    } catch (e, stackTrace) {
      logE(e, stackTrace);
      return Left(ApiException());
    }
  }
}
