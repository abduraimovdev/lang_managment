import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  late Map<String, String> _localizedValues;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  Future<AppLocalizations> load() async {
    final jsonStringValues = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    final mappedJson = json.decode(jsonStringValues) as Map<String, dynamic>;
    _localizedValues = mappedJson.map((key, dynamic value) => MapEntry(key, value.toString()));

    return this;
  }

  String tr(String key) => _localizedValues[key]!;

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ru', 'uz', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async => SynchronousFuture<AppLocalizations>(
        await AppLocalizations(locale).load(),
      );

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
