import 'package:translate_app/core/typedef/typedef.dart';
import 'package:translate_app/layers/data/raw/result_data.dart';
import 'package:translate_app/layers/data/request/favorite_request.dart';
import 'package:translate_app/layers/domain/entities/favorite_model.dart';

abstract class FavoriteRepository {
  Future<ApiResponseData<List<FavoriteModel>>> getAllFavorite();
  Future<ApiResponseData<ResultData>> updateFavorite(FavoriteRequest request);
}
