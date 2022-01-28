import 'package:slug/slug.dart';
import 'package:slug/src/progress/ansi_progress.dart';
import 'package:slug/src/progress/simple_progress.dart';
import 'dart:io' as io;

class SlugProgress implements Slug {
  final Ansi _ansi;

  final SlugStyle _slugStyle;

  Progress? _currentProgress;

  SlugProgress({Ansi? ansi, SlugStyle? slugStyle})
      : _slugStyle = slugStyle ?? SlugStyle.dots,
        _ansi = ansi ?? Ansi(Ansi.terminalSupportsAnsi);

  @override
  void stdout(String message) {
    _cancelProgress();
    io.stdout.write(message);
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
    var progress = _ansi.useAnsi
        ? AnsiProgress(_ansi, message, _slugStyle)
        : SimpleProgress(this, message);
    _currentProgress = progress;
    return progress;
  }
}
