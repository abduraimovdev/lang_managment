import 'dart:convert';
import 'package:flutter/services.dart';

class Translate {
  Translate._();
  static String customLang = "en";

  static Map<String, dynamic> uz = {};
  static Map<String, dynamic> en = {};
  static Map<String, dynamic> ru = {};

  static Future<void> readJson() async {
    _readUz();
    _readEn();
    _readRu();
  }

  static Future<void> _readUz() async {
    final String json = await rootBundle.loadString('assets/translate/uz.json');
    final data = jsonDecode(json) as Map<String, dynamic>;
    uz = data;
  }

  static Future<void> _readEn() async {
    final String json =
        await rootBundle.loadString('assets/translate/eng.json');
    final data = jsonDecode(json) as Map<String, dynamic>;
    en = data;
  }

  static Future<void> _readRu() async {
    final String json = await rootBundle.loadString('assets/translate/ru.json');
    final data = jsonDecode(json) as Map<String, dynamic>;
    ru = data;
  }
}

enum Lang {
  en,
  uz,
  ru,
}

extension LangExt on Lang {
  void change() {
    Translate.customLang = name;
  }
}
