import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LangCodes { uz, ru, en}

final localController = LocalController();

const String _spLocalKey = 'app_local';



class LocalController with ChangeNotifier {
  LocalController() : _appLocal = 'ru' {
    SharedPreferences.getInstance().then<void>(
      (sp) {
        final appLocal = sp.getString(_spLocalKey);
        if (appLocal != null && appLocal.isNotEmpty) {
          _appLocal = appLocal;
          notifyListeners();
        }
      },
    
    );
  }

  Locale get appLocal => _appLocal == 'uz' ? const Locale('uz', 'UZ') : _appLocal == 'en' ? const Locale('en', 'EN') : const Locale('ru', 'RU');

  String _appLocal;

  void changeLocal(LangCodes langCode) {
    _appLocal = langCode.name;

    SharedPreferences.getInstance().then<void>(
      (sp) {
        sp.setString(_spLocalKey, _appLocal);
      },
      
    );
    notifyListeners();
  }
}
