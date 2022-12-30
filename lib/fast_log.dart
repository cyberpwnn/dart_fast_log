library fast_log;

import 'package:colored_print/colored_print.dart';

bool lDebugMode = true;
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

void _log(dynamic f, {String category = 'Info', PrintColor? color}) =>
    lDebugMode
        ? color != null
            ? ColoredPrint.show("[$category]: ${f ?? 'null'}",
                messageColor: color)
            // ignore: avoid_print
            : print("[$category]: ${f ?? 'null'}")
        : {};

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
