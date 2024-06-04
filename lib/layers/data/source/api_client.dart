
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;
import 'package:translate_app/app_config/app_config.dart';
import 'package:translate_app/layers/data/raw/favorite_data.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;
  @GET('/favorite')
  Future<List<FavoriteData>> getAllFavorite();

  // @POST('/v1/DiaChiGiaoHang/update')
  // @MultiPart()
  // Future<ResultData> updateAddress(@Part() ShipAddressData itemdata);
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
  Future<List<FavoriteData>> getAllFavorite() => _client.getAllFavorite();
}
