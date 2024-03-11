import 'package:flutter/material.dart';
import 'package:translate_app/layers/domain/entities/language_model.dart';

import 'choose_languagle.dart';
import 'translate_input.dart';
import 'translate_text.dart';

class TranslateContainer extends StatefulWidget {
  final void Function(LanguageModel firstCode, LanguageModel secondCode)
      onLanguageChanged;
  final bool isTextTouched;
  final Function(bool) onTextTouched;
  final FocusNode textFocusNode;
  final LanguageModel firstLanguage;
  final LanguageModel secondLanguage;

  const TranslateContainer({
    Key? key,
    required this.onLanguageChanged,
    required this.isTextTouched,
    required this.onTextTouched,
    required this.textFocusNode,
    required this.firstLanguage,
    required this.secondLanguage,
  }) : super(key: key);

  @override
  State<TranslateContainer> createState() => _TranslateContainerState();
}

class _TranslateContainerState extends State<TranslateContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ChooseLanguage(
                onLanguageChanged: widget.onLanguageChanged,
              ),
              const SizedBox(height: 10),
              Stack(
                children: <Widget>[
                  Offstage(
                    offstage: widget.isTextTouched,
                    child: TranslateText(
                      onTextTouched: widget.onTextTouched,
                    ),
                  ),
                  Offstage(
                    offstage: !widget.isTextTouched,
                    child: TranslateInput(
                      onCloseClicked: widget.onTextTouched,
                      focusNode: widget.textFocusNode,
                      firstLanguage: widget.firstLanguage,
                      secondLanguage: widget.secondLanguage,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
