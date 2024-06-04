import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translate_app/generated/assets.gen.dart';
import 'package:translate_app/layers/domain/entities/favorite_model.dart';

class FavoriteSelectItem extends StatelessWidget {
  final FavoriteModel favoriteModel;

  const FavoriteSelectItem({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
                padding: const EdgeInsets.all(12),
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
                child: Image.network(favoriteModel.url, height: 40)),
            Positioned(right: -2, child: SvgPicture.asset(Assets.svg.remove))
          ],
        ),
        const SizedBox(height: 8),
        Text(favoriteModel.name,
            style: const TextStyle(fontSize: 15, color: Colors.black))
      ],
    );
  }
}
