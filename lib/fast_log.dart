library fast_log;

import 'package:colored_print/colored_print.dart';
import 'package:flutter/foundation.dart';

void _log(dynamic f, {String category = 'Info', PrintColor? color}) =>
    kDebugMode
        ? color != null
            ? ColoredPrint.show("[$category]: ${f ?? 'null'}",
                messageColor: color)
            // ignore: avoid_print
            : print("[$category]: ${f ?? 'null'}")
        : {};

void info(dynamic f, {PrintColor? color}) =>
    _log(f, category: 'Info', color: color ?? PrintColor.cyan);

void success(dynamic f, {PrintColor? color}) =>
    _log(f, category: 'Success', color: color ?? PrintColor.green);

void warn(dynamic f, {PrintColor? color}) =>
    _log(f, category: 'Warning', color: color ?? PrintColor.yellow);

void error(dynamic f, {PrintColor? color}) =>
    _log(f, category: 'Error', color: color ?? PrintColor.red);

void verbose(dynamic f, {PrintColor? color}) =>
    _log(f, category: 'Verbose', color: color ?? PrintColor.white);

void navigation(dynamic f, {PrintColor? color}) =>
    _log(f, category: 'Navigation', color: color ?? PrintColor.blue);

void actioned(dynamic f, {PrintColor? color}) =>
    _log(f, category: 'Actioned', color: color ?? PrintColor.magenta);
