import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;
import 'package:translate_app/app_config/app_config.dart';
import 'package:translate_app/layers/data/raw/favorite_data.dart';
import 'package:translate_app/layers/data/raw/result_data.dart';
import 'package:translate_app/layers/data/raw/user_info_data.dart';
import 'package:translate_app/layers/data/request/add_friend_request.dart';
import 'package:translate_app/layers/data/request/favorite_request.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;
  @GET('/favorite')
  Future<List<FavoriteData>?> getAllFavorite();

  @GET('/user/recommendFriends')
  Future<List<UserInfoData>?> getUserInfo(@Query('userIp') String userIp);

  @POST('/favorite/add-multiple-favor')
  Future<ResultData> updateFavorite(@Body() FavoriteRequest request);

  @POST('/user/addFriendRequest')
  Future<ResultData> addPriend(@Body() AddFriendRequest request);

  @GET('/user/findAllAddFriendRequest')
  Future<List<UserInfoData>?> getFriendInvite(@Query('userIp') String userIp);

  @GET('/user/findFriends')
  Future<List<UserInfoData>?> findAllFriends(@Query('userIp') String userIp);

  @POST('/user/acceptFriendRequest')
  Future<ResultData> acceptFriendRequest(@Body() AddFriendRequest request);
}

class ApiClientImpl implements ApiClient {
  static final ApiClientImpl _instance = ApiClientImpl._();

  late final ApiClient _client;

  late final Dio _dio;

  factory ApiClientImpl() {
    return _instance;
  }

  ApiClientImpl._() {
    _dio = Dio(BaseOptions(contentType: Headers.jsonContentType));

    _client =
        ApiClient(_dio, baseUrl: Uri.http(AppConfig.info.baseUrl).toString());
  }

  @override
  Future<List<FavoriteData>?> getAllFavorite() => _client.getAllFavorite();

  @override
  Future<List<UserInfoData>?> getUserInfo(String userIp) =>
      _client.getUserInfo(userIp);

  @override
  Future<ResultData> updateFavorite(FavoriteRequest request) =>
      _client.updateFavorite(request);

  @override
  Future<ResultData> addPriend(AddFriendRequest request) =>
      _client.addPriend(request);

  @override
  Future<List<UserInfoData>?> findAllFriends(String userIp) =>
      _client.findAllFriends(userIp);

  @override
  Future<ResultData> acceptFriendRequest(AddFriendRequest request) =>
      _client.acceptFriendRequest(request);

  @override
  Future<List<UserInfoData>?> getFriendInvite(String userIp) =>
      _client.getFriendInvite(userIp);
}
