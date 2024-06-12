import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translate_app/generated/assets.gen.dart';
import 'package:translate_app/layers/domain/entities/favorite_model.dart';

class FavoriteSelectItem extends StatelessWidget {
  final FavoriteModel favoriteModel;
  final bool? isSlected;

  const FavoriteSelectItem(
      {super.key, required this.favoriteModel, this.isSlected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 20,
                        color: Color(0xffEEEFF2))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xffE3E3E3))),
              child: CachedNetworkImage(
                imageUrl: favoriteModel.url,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.sports_baseball),
              ),
            ),
            Positioned(
                right: -2,
                child: SvgPicture.asset(isSlected != true
                    ? Assets.svg.sameFavorite
                    : Assets.svg.remove))
          ],
        ),
        const SizedBox(height: 8),
        Text(favoriteModel.name,
            style: const TextStyle(fontSize: 15, color: Colors.black))
      ],
    );
  }
}
