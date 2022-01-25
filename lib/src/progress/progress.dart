library cli_logging;

import 'dart:async';
import 'dart:io' as io;

import 'package:slug/src/ansi.dart';
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
}

class SimpleProgress extends Progress {
  final Slug logger;

  SimpleProgress(this.logger, String message) : super(message) {
    logger.stdout('$message...');
  }

  @override
  void cancel() {}

  @override
  void finish({String? message, bool showTiming = false}) {}
}

class AnsiProgress extends Progress {
  static const List<String> kAnimationItems = [
    "⠁",
    "⠁",
    "⠉",
    "⠙",
    "⠚",
    "⠒",
    "⠂",
    "⠂",
    "⠒",
    "⠲",
    "⠴",
    "⠤",
    "⠄",
    "⠄",
    "⠤",
    "⠠",
    "⠠",
    "⠤",
    "⠦",
    "⠖",
    "⠒",
    "⠐",
    "⠐",
    "⠒",
    "⠓",
    "⠋",
    "⠉",
    "⠈",
    "⠈"
  ];

  final Ansi ansi;

  late final Timer _timer;

  AnsiProgress(this.ansi, String message) : super(message) {
    _timer = Timer.periodic(Duration(milliseconds: 80), (t) {
      _updateDisplay();
    });
    io.stdout.write('$message...  '.padRight(40));
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
      _updateDisplay(isFinal: true, message: message, showTiming: showTiming);
    }
  }

  void _updateDisplay(  {
    bool isFinal = false,
    bool cancelled = false,
    String? message,
    bool showTiming = false,
  }) {
    var char =
        ansi.greenF(kAnimationItems[_timer.tick % kAnimationItems.length]);
    if (isFinal || cancelled) {
      char = '';
    }
    io.stdout.write('${ansi.backspace}$char');
    if (isFinal || cancelled) {
      if (message != null) {
        io.stdout.write(message.isEmpty ? ' ' : message);
      } else if (showTiming) {
        var time = (elapsed.inMilliseconds / 1000.0).toStringAsFixed(1);
        io.stdout.write('${time}s');
      } else {
        io.stdout.write(' ');
      }
      io.stdout.writeln();
    }
  }
}
