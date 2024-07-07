import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:user_chat_app/localization/locales.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;
  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
    print(_currentLocale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
            value: _currentLocale,
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text("English"),
              ),
              DropdownMenuItem(
                value: 'ne',
                child: Text("Nepali"),
              ),
            ],
            onChanged: (value) {
              _setLocale(value);
            },
          )
        ],
      ),
      body: Center(child: Text(LocaleData.title.getString(context))),
    );
  }

  void _setLocale(String? value) {
    if (value == null) return;
    if (value == "en") {
      _flutterLocalization.translate("en");
    } else if (value == "ne") {
      _flutterLocalization.translate("ne");
    } else {
      return;
    }
    setState(() {
      _currentLocale = value;
    });
  }
}
