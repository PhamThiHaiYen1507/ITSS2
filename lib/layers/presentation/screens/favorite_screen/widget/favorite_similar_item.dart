import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:translate_app/layers/domain/entities/favorite_model.dart';

class FavoriteSimilarItem extends StatelessWidget {
  final FavoriteModel favoriteModel;
  const FavoriteSimilarItem({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRect(
            clipBehavior: Clip.none,
            child: Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              child: CachedNetworkImage(
                imageUrl: favoriteModel.url,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.sports_baseball),
              ),
            )),
        const SizedBox(height: 8),
        Text(favoriteModel.name,
            style: const TextStyle(fontSize: 15, color: Colors.black))
      ],
    );
  }
}
