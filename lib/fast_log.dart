library fast_log;

import 'package:colored_print/colored_print.dart';

bool lDebugMode = true;
bool truncate = true;
LogHandler? lLogHandler;

typedef LogHandler = void Function(LogCategory category, String log);

enum LogCategory {
  info,
  success,
  warning,
  error,
  verbose,
  navigation,
  actioned,
  network
}

List<String> _truncate(String longLog) {
  if (!truncate) {
    return [longLog];
  }

  List<String> s = longLog
      .splitMapJoin(
        RegExp('.{1,1024}'),
        onMatch: (m) => '${m.group(0)}\n',
        onNonMatch: (n) => n,
      )
      .split('\n');
  s.removeWhere((element) => element.trim().isEmpty);
  return s;
}

void _log(dynamic f, {String category = 'Info', PrintColor? color}) {
  if (lDebugMode) {
    if (color != null) {
      for (String i in _truncate(f.toString())) {
        ColoredPrint.show("[$category]: $i", messageColor: color);
      }
    } else {
      for (String i in _truncate(f.toString())) {
        print("[$category]: $i");
      }
    }
  }
}

void info(dynamic f, {PrintColor? color}) {
  _log(f, category: 'Info', color: color ?? PrintColor.cyan);
  lLogHandler?.call(LogCategory.info, "${f ?? 'null'}");
}

void success(dynamic f, {PrintColor? color}) {
  _log(f, category: 'Success', color: color ?? PrintColor.green);
  lLogHandler?.call(LogCategory.success, "${f ?? 'null'}");
}

void warn(dynamic f, {PrintColor? color}) {
  _log(f, category: 'Warning', color: color ?? PrintColor.yellow);
  lLogHandler?.call(LogCategory.warning, "${f ?? 'null'}");
}

void error(dynamic f, {PrintColor? color}) {
  _log(f, category: 'Error', color: color ?? PrintColor.red);
  lLogHandler?.call(LogCategory.error, "${f ?? 'null'}");
}

void network(dynamic f, {PrintColor? color}) {
  _log(f, category: 'Network', color: color ?? PrintColor.blue);
  lLogHandler?.call(LogCategory.network, "${f ?? 'null'}");
}

void verbose(dynamic f, {PrintColor? color}) {
  _log(f, category: 'Verbose', color: color ?? PrintColor.white);
  lLogHandler?.call(LogCategory.verbose, "${f ?? 'null'}");
}

void navigation(dynamic f, {PrintColor? color}) {
  _log(f, category: 'Navigation', color: color ?? PrintColor.cyan);
  lLogHandler?.call(LogCategory.navigation, "${f ?? 'null'}");
}

void actioned(dynamic f, {PrintColor? color}) {
  _log(f, category: 'Actioned', color: color ?? PrintColor.magenta);
  lLogHandler?.call(LogCategory.actioned, "${f ?? 'null'}");
}
