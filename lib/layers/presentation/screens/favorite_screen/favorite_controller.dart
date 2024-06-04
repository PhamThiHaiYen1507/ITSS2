import 'package:get/get.dart';
import 'package:translate_app/layers/domain/entities/favorite_model.dart';
import 'package:translate_app/layers/domain/repository/favorite_repository.dart';

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
}
