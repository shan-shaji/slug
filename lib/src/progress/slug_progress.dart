import 'dart:io' as io;

import 'package:slug/slug.dart';

class SlugProgress implements Slug {
  @override
  Ansi ansi;

  SlugProgress({Ansi? ansi}) : ansi = ansi ?? Ansi(Ansi.terminalSupportsAnsi);

  Progress? _currentProgress;

  @override
  void stderr(String message) {
    _cancelProgress();
    io.stderr.writeln(message);
  }

  @override
  void stdout(String message) {
    _cancelProgress();
    print(message);
  }

  @override
  void trace(String message) {}

  @override
  void write(String message) {
    _cancelProgress();
    io.stdout.write(message);
  }

  @override
  void writeCharCode(int charCode) {
    _cancelProgress();
    io.stdout.writeCharCode(charCode);
  }

  void _cancelProgress() {
    var progress = _currentProgress;
    if (progress != null) {
      _currentProgress = null;
      progress.cancel();
    }
  }

  @override
  Progress progress(String message) {
    _cancelProgress();
    var progress = ansi.useAnsi
        ? AnsiProgress(ansi, message)
        : SimpleProgress(this, message);
    _currentProgress = progress;
    return progress;
  }

  @override
  @Deprecated('This method will be removed in the future')
  void flush() {}
}
