import 'package:flutter/material.dart';
import 'package:translate_app/layers/domain/entities/favorite_model.dart';
import 'package:translate_app/utils/app_logger/app_logger.dart';

class FavoriteSimilarItem extends StatelessWidget {
  final FavoriteModel favoriteModel;
  const FavoriteSimilarItem({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRect(
            child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.network(favoriteModel.url, height: 40))),
        const SizedBox(height: 8),
        Text(favoriteModel.name,
            style: const TextStyle(fontSize: 15, color: Colors.black))
      ],
    );
  }
}
