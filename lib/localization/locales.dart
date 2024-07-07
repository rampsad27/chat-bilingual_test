import 'package:flutter_localization/flutter_localization.dart';

List<MapLocale> LOCALES = [
  const MapLocale("en", LocaleData.EN),
  const MapLocale("ne", LocaleData.NE),
];

mixin LocaleData {
  static const String title = 'title';
  static const String body = 'body';

  static const Map<String, dynamic> EN = {
    title: 'Localizsdfation',
    body: 'sddfdsfdsf',
  };
  static const Map<String, dynamic> NE = {
    title: '	शुभ रात्री',
    body: 'नमस्ते',
  };
}
