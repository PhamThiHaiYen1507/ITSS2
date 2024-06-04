import 'package:translate_app/core/typedef/typedef.dart';
import 'package:translate_app/layers/domain/entities/favorite_model.dart';

abstract class FavoriteRepository {
  Future<ApiResponseData<List<FavoriteModel>>> getAllFavorite();
}
