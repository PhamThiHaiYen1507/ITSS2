import 'package:flutter/material.dart';
import 'package:translate_app/layers/domain/entities/language_model.dart';
import 'package:translator/translator.dart';

class TranslateInput extends StatefulWidget {
  const TranslateInput(
      {Key? key,
      required this.onCloseClicked,
      required this.focusNode,
      required this.firstLanguage,
      required this.secondLanguage})
      : super(key: key);

  final Function(bool) onCloseClicked;
  final FocusNode focusNode;
  final LanguageModel firstLanguage;
  final LanguageModel secondLanguage;

  @override
  _TranslateInputState createState() => _TranslateInputState();
}

class _TranslateInputState extends State<TranslateInput> {
  String _textTranslated = "";
  final GoogleTranslator _translator = GoogleTranslator();
  final TextEditingController _textEditingController = TextEditingController();

  _onTextChanged(String text) {
    if (text != "") {
      _translator
          .translate(text,
              from: widget.firstLanguage.code, to: widget.secondLanguage.code)
          .then((translatedText) {
        setState(() {
          _textTranslated = translatedText as String;
        });
      });
    } else {
      setState(() {
        _textTranslated = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: TextField(
                focusNode: widget.focusNode,
                controller: _textEditingController,
                onChanged: _onTextChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        _textEditingController.clear();
                      });
                    },
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _textTranslated,
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
