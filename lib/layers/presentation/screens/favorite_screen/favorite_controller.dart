import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:translate_app/layers/data/raw/result_data.dart';
import 'package:translate_app/layers/data/request/favorite_request.dart';
import 'package:translate_app/layers/domain/entities/favorite_model.dart';
import 'package:translate_app/layers/domain/repository/favorite_repository.dart';
import 'package:translate_app/utils/app_logger/app_logger.dart';

class FavoriteController extends GetxController {
  final FavoriteRepository _favoriteRepository;
  late final Rx<List<FavoriteModel>> favoriteList;
  late final Rx<List<FavoriteModel>> favoriteListSelected;

  FavoriteController(this._favoriteRepository);
  @override
  void onInit() {
    favoriteList = Rx([]);
    favoriteListSelected = Rx([]);
    getAllShop();
    super.onInit();
  }

  Future<void> getAllShop() async {
    final res = await _favoriteRepository.getAllFavorite();

    res.map((right) {
      favoriteList.update((val) {
        val?.addAll(right);
      });
    });
  }

  void onSelectedFavorite(FavoriteModel favoriteModel) {
    favoriteListSelected.update((val) => val?.add(favoriteModel));
    favoriteList.update((val) => val?.remove(favoriteModel));
  }

  void onRemoveFavorite(FavoriteModel favoriteModel) {
    favoriteListSelected.update((val) => val?.remove(favoriteModel));
    favoriteList.update((val) => val?.add(favoriteModel));
  }

  Future<void> updateFavorite() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    final String deviceId = androidDeviceInfo.id;
   final data  = await _favoriteRepository.updateFavorite(FavoriteRequest(
        userIp: deviceId,
        favoriteIds:
            favoriteListSelected.value.map((data) => data.id).toList()));
    
  }
}
