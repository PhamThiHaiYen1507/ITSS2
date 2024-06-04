import 'package:either_dart/either.dart';
import 'package:translate_app/core/exceptions/api_exception.dart';
import 'package:translate_app/core/typedef/typedef.dart';
import 'package:translate_app/layers/data/raw/favorite_data.dart';
import 'package:translate_app/layers/data/source/api_client.dart';
import 'package:translate_app/layers/domain/entities/favorite_model.dart';
import 'package:translate_app/layers/domain/repository/favorite_repository.dart';
import 'package:translate_app/utils/app_logger/app_logger.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final ApiClient _client = ApiClientImpl();

  @override
  Future<ApiResponseData<List<FavoriteModel>>> getAllFavorite() async {
    try {
      final res = await _client.getAllFavorite();
      return Right(res.map((e) => e.toFavoriteModel()).toList());
    } catch (e, stackTrace) {
      logE(e, stackTrace);
      return Left(ApiException());
    }
  }
}
