import 'package:flutter/material.dart';
import 'package:translate_app/layers/domain/entities/language_model.dart';
import 'package:translate_app/styles/app_text_style.dart';
import 'package:translate_app/styles/app_theme.dart';
import 'package:translate_app/styles/styles_extension.dart';

import '../../widgets/main_action_button/main_action_button.dart';
import 'widgets/main_translate_container.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, required this.initialIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    LanguageModel firstLanguage =
        LanguageModel('en', 'English', true, true, true);
    LanguageModel secondLanguage =
        LanguageModel('es', 'Spanish', true, true, true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Trang chủ'),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: widget.initialIndex,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 42,
              decoration: const BoxDecoration(
                color: Colors.white,
              ).defautlShadow,
              child: TabBar(
                  indicator: const BoxDecoration(color: AppThemes.primaryColor),
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: AppThemes.primaryColor,
                  labelColor: Colors.white,
                  labelStyle: AppTextStyle.titleTextN,
                  tabs: const [
                    Tab(text: 'DỊCH THUẬT'),
                    Tab(text: 'NOTE'),
                  ]),
            ),
            TranslateContainer(
              onLanguageChanged: (firstCode, secondCode) {},
              firstLanguage: firstLanguage,
              secondLanguage: secondLanguage,
              isTextTouched: false,
              onTextTouched: (p0) {},
              textFocusNode: focusNode,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 150, // Điều chỉnh kích thước chiều cao mong muốn
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment
                    .stretch, // Đảm bảo chiều cao của cả Row được căng ra
                children: [
                  Expanded(
                    child: MainActionButton(),
                  ),
                  SizedBox(
                      width:
                          8), // Khoảng cách giữa Container button lớn và hàng ngang
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment
                          .stretch, // Đảm bảo chiều cao của cả Column được căng ra
                      children: [
                        Expanded(
                          child: MainActionButton(),
                        ),
                        SizedBox(
                            height:
                                8), // Khoảng cách giữa hai Container button nhỏ
                        Expanded(
                          child: MainActionButton(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
