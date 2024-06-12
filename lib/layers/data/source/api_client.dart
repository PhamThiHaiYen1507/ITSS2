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
  Future<List<UserInfoData>?> getAddFriend(@Query('userIp') String userIp);
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
        ApiClient(_dio, baseUrl: Uri.https(AppConfig.info.baseUrl).toString());
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
  Future<List<UserInfoData>?> getAddFriend(String userIp) =>
      _client.getAddFriend(userIp);
}
