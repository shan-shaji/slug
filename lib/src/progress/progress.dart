import 'dart:async';
import 'dart:io' as io;

import 'package:chalk/chalk.dart';
import 'package:slug/src/ansi.dart';
import 'package:slug/src/enums/slug_style.dart';
import 'package:slug/src/helpers/spinners.dart';
import 'package:slug/src/progress/slug_log.dart';

/// A handle to an indeterminate progress display.
abstract class Progress {
  final String message;
  final Stopwatch _stopwatch;

  Progress(this.message) : _stopwatch = Stopwatch()..start();

  Duration get elapsed => _stopwatch.elapsed;

  /// Finish the indeterminate progress display.
  void finish({String? message, bool showTiming = false});

  /// Cancel the indeterminate progress display.
  void cancel();

  ///
  void error({String? message, bool showTiming = false});
}

class SimpleProgress extends Progress {
  final Slug slug;

  SimpleProgress(this.slug, String message) : super(message) {
    slug.stdout('$message...');
  }

  @override
  void cancel() {}

  @override
  void finish({String? message, bool showTiming = false}) {}

  @override
  void error({String? message, bool showTiming = false}) {}
}

class AnsiProgress extends Progress {
  var ch = Chalk();
  late SlugStyle _slugStyle;

  final Ansi ansi;

  late final Timer _timer;

  AnsiProgress(this.ansi, String message, SlugStyle slugStyle)
      : super(message) {
    _slugStyle = slugStyle;
    _timer = Timer.periodic(Duration(milliseconds: 80), (t) {
      _updateDisplay();
    });
    io.stdout.write('$message  '.padRight(40));
    _updateDisplay();
  }

  @override
  void cancel() {
    if (_timer.isActive) {
      _timer.cancel();
      _updateDisplay(cancelled: true);
    }
  }

  @override
  void finish({String? message, bool showTiming = false}) {
    if (_timer.isActive) {
      _timer.cancel();
      _updateDisplay(
        isFinal: true,
        message: ch.green(
          "✔ $message",
          ftFace: ChalkFtFace.bold,
        ),
        showTiming: showTiming,
        symbol: ch.green(
          '✔',
          ftFace: ChalkFtFace.bold,
        ),
      );
    }
  }

  void _updateDisplay({
    bool isFinal = false,
    bool cancelled = false,
    String? message,
    bool showTiming = false,
    String? symbol,
  }) {
    Spinner spinner = getFrame(_slugStyle);
    var char = ch.green(spinner.frames[_timer.tick % spinner.frames.length]);
    if (isFinal || cancelled) {
      char = '';
    }
    io.stdout.write('${ansi.backspace}$char');
    if (isFinal || cancelled) {
      if (message != null) {
        io.stdout.write(message.isEmpty ? ' ' : message);
      } else if (showTiming) {
        var time = (elapsed.inMilliseconds / 1000.0).toStringAsFixed(1);
        io.stdout.write('${symbol ?? ""} $time s');
      } else {
        io.stdout.write(' ');
      }
      io.stdout.writeln();
    }
  }

  @override
  void error({String? message, bool showTiming = false}) {
    if (_timer.isActive) {
      _timer.cancel();
      _updateDisplay(
        isFinal: true,
        message: ch.red("✖ $message", ftFace: ChalkFtFace.bold),
        showTiming: showTiming,
        symbol: ch.red("✖", ftFace: ChalkFtFace.bold),
      );
    }
  }
}
