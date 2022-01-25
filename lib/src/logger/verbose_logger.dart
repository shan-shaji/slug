import 'dart:io' as io;

import 'package:slug/progress.dart';
import 'package:slug/src/ansi.dart';
import 'package:slug/src/logger/slug_log.dart';

class VerboseLogger implements Slug {
  @override
  Ansi ansi;
  bool logTime;
  final _timer = Stopwatch()..start();

  VerboseLogger({Ansi? ansi, this.logTime = false})
      : ansi = ansi ?? Ansi(Ansi.terminalSupportsAnsi);

  @override
  bool get isVerbose => true;

  @override
  void stdout(String message) {
    io.stdout.writeln('${_createPrefix()}$message');
  }

  @override
  void stderr(String message) {
    io.stderr.writeln('${_createPrefix()}${ansi.red}$message${ansi.none}');
  }

  @override
  void trace(String message) {
    io.stdout.writeln('${_createPrefix()}${ansi.gray}$message${ansi.none}');
  }

  @override
  void write(String message) {
    io.stdout.write(message);
  }

  @override
  void writeCharCode(int charCode) {
    io.stdout.writeCharCode(charCode);
  }

  @override
  Progress progress(String message) => SimpleProgress(this, message);

  @override
  @Deprecated('This method will be removed in the future')
  void flush() {}

  String _createPrefix() {
    if (!logTime) {
      return '';
    }

    var seconds = _timer.elapsedMilliseconds / 1000.0;
    var minutes = seconds ~/ 60;
    seconds -= minutes * 60.0;

    var buf = StringBuffer();
    if (minutes > 0) {
      buf.write((minutes % 60));
      buf.write('m ');
    }

    buf.write(seconds.toStringAsFixed(3).padLeft(minutes > 0 ? 6 : 1, '0'));
    buf.write('s');

    return '[${buf.toString().padLeft(11)}] ';
  }
}
