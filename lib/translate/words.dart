import 'package:flutter/material.dart';

import 'app_localizations.dart';

extension MyWords on Words {
  String tr(BuildContext context, [int? key]) => AppLocalizations.of(context).tr("$name${key ?? ""}");
}

enum Words {
 title,
}
