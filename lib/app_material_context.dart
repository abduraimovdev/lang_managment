import 'package:flutter/material.dart';
import 'package:translate/pages/main_page.dart';
import 'package:translate/settings/inherited_local_notifier.dart';
import 'package:translate/settings/local_controller.dart';
import 'package:translate/translate/app_localizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

class AppMaterialContext extends StatefulWidget {
  const AppMaterialContext({super.key});

  @override
  State<AppMaterialContext> createState() => _AppMaterialContextState();
}

class _AppMaterialContextState extends State<AppMaterialContext> {
  @override
  Widget build(BuildContext context) => InheritedLocalNotifier(
        localController: localController,
        child: Builder(
          builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Zaamin',
            locale: InheritedLocalNotifier.maybeOf(context)?.appLocal ??
                const Locale('ru', 'RU'),
            supportedLocales: const [
              Locale('uz', 'UZ'),
              Locale('ru', 'RU'),
              Locale('en', 'EN')
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback:
                (final deviceLocale, final supportedLocales) {
              final local =
                  InheritedLocalNotifier.maybeOf(context, listen: false)!;

              for (final locale in supportedLocales) {
                if (locale.languageCode == local.appLocal.languageCode) {
                  return local.appLocal;
                }
              }
              for (final locale in supportedLocales) {
                if (deviceLocale == locale) {
                  return deviceLocale;
                }
              }
              local.changeLocal(LangCodes.ru);
              return const Locale('ru', 'RU');
            },
            home: MainPage(),
            // initialRoute: "/"
          ),
        ),
      );
}
