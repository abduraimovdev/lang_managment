import 'package:flutter/material.dart';
import 'package:translate/settings/local_controller.dart';
import 'package:translate/translate/translate.dart';
import 'package:translate/translate/wordsTwo.dart';

import '../translate/words.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(Words.title.tr(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  localController.changeLocal(LangCodes.uz);
                },
                child: const Text("Uz"),
              ),
              TextButton(
                onPressed: () {
                  localController.changeLocal(LangCodes.en);
                },
                child: const Text("En"),
              ),
              TextButton(
                onPressed: () {
                  localController.changeLocal(LangCodes.ru);
                },
                child: const Text("Ru"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void btnUz() {
    Lang.uz.change();
    setState(() {});
  }

  void btnEn() {
    Lang.en.change();
    setState(() {});
  }

  void btnRu() {
    Lang.ru.change();
    setState(() {});
  }
}
