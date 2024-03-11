import 'package:flutter/material.dart';
import 'package:translate_app/styles/app_text_style.dart';
import 'package:translate_app/styles/app_theme.dart';
import 'package:translate_app/styles/styles_extension.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [''];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ưa thích'),
      ),
      body: items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 120,
                    color: AppThemes.primaryColor,
                  ),
                  Text(
                    'Bạn chưa lưu từ ưa thích nào cả',
                    style: AppTextStyle.bodyTextSB,
                  )
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: 1,
              itemBuilder: (context, index) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16)))
                    .defautlShadow,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Can I help you?',
                              style: AppTextStyle.titleTextN
                                  .copyWith(color: AppThemes.greyColor),
                            ),
                            Text(
                              'Tôi có thể giúp gì cho bạn không?',
                              style: AppTextStyle.titleTextN
                                  .copyWith(color: AppThemes.primaryColor),
                            ),
                          ]),
                    ),
                    Column(
                      children: [
                        SizedBox.square(
                          dimension: 32,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.star_rate_rounded)),
                        ),
                        SizedBox.square(
                          dimension: 32,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.volume_up)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            ),
    );
  }
}
