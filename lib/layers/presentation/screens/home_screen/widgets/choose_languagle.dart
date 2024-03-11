import 'package:flutter/material.dart';
import 'package:translate_app/layers/domain/entities/language_model.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key, required this.onLanguageChanged})
      : super(key: key);

  final Function(LanguageModel firstCode, LanguageModel secondCode)
      onLanguageChanged;

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  LanguageModel _firstLanguage =
      LanguageModel("en", "English", true, true, true);
  LanguageModel _secondLanguage =
      LanguageModel("es", "Spanish", true, true, true);

  void _switchLanguage() {
    LanguageModel tmpLanguage = _firstLanguage;

    setState(() {
      _firstLanguage = _secondLanguage;
      _secondLanguage = tmpLanguage;
    });

    widget.onLanguageChanged(_firstLanguage, _secondLanguage);
  }

  // void _chooseFirstLanguage(String title, bool isAutomaticEnabled) async {
  //   final language = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => LanguagePage(
  //         title: title,
  //         isAutomaticEnabled: isAutomaticEnabled,
  //       ),
  //     ),
  //   );

  //   if (language != null) {
  //     setState(() {
  //       _firstLanguage = language;
  //     });
  //     widget.onLanguageChanged(_firstLanguage, _secondLanguage);
  //   }
  // }

  // void _chooseSecondLanguage(String title, bool isAutomaticEnabled) async {
  //   final language = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => LanguagePage(
  //         title: title,
  //         isAutomaticEnabled: isAutomaticEnabled,
  //       ),
  //     ),
  //   );

  //   if (language != null) {
  //     setState(() {
  //       _secondLanguage = language;
  //     });
  //     widget.onLanguageChanged(_firstLanguage, _secondLanguage);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFCECECE),
          width: 0.5,
        ),
      ),
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  // _chooseFirstLanguage("Translate from", true);
                },
                child: Center(
                  child: Text(
                    _firstLanguage.name,
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.grey[700],
              ),
              onPressed: () {
                _switchLanguage();
              },
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  // _chooseSecondLanguage("Translate to", false);
                },
                child: Center(
                  child: Text(
                    _secondLanguage.name,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
