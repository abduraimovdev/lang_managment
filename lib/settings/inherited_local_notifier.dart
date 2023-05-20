import 'package:flutter/widgets.dart';
import 'local_controller.dart';

@immutable
class InheritedLocalNotifier extends InheritedNotifier<LocalController> {
  const InheritedLocalNotifier({
    required final LocalController localController,
    required final Widget child,
    Key? key,
  }) : super(
          key: key,
          child: child,
          notifier: localController,
        );

  static LocalController? maybeOf(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context.dependOnInheritedWidgetOfExactType<InheritedLocalNotifier>()?.notifier;
    } else {
      final inhW = context.getElementForInheritedWidgetOfExactType<InheritedLocalNotifier>()?.widget;
      return inhW is InheritedLocalNotifier ? inhW.notifier : null;
    }
  }
}
