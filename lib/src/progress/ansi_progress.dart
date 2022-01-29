import 'dart:async';
import 'dart:io' as io;

import 'package:ansi_escapes/ansi_escapes.dart';
import 'package:chalk/chalk.dart';
import 'package:slug/src/helpers/ansi.dart';
import 'package:slug/src/enums/slug_style.dart';
import 'package:slug/src/helpers/spinners.dart';
import 'package:slug/src/helpers/symbols.dart';
import 'package:slug/src/progress/progress.dart';

class AnsiProgress extends Progress {
  // Property to assign frames from the [Spinner] object
  late List<String> _frames;

  // Property to assign [Spinner] type based on [SlugStyle]
  late Spinner _spinner;

  // Timer variable to handle frame
  late final Timer _timer;

  // Property to handle cursor visibility by default it will be true.
  late bool _hideCursor;

  // Property to check of the terminal have ansi support
  final Ansi ansi;

  AnsiProgress(this.ansi, String message, SlugStyle slugStyle, bool hideCursor)
      : super(message) {
    _spinner = getFrame(slugStyle);
    _frames = _spinner.frames;
    _timer = Timer.periodic(Duration(milliseconds: _spinner.interval), (t) {
      _updateDisplay();
    });
    _hideCursor = hideCursor;
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
  void finish({
    String? message,
    bool showTiming = false,
  }) {
    if (_timer.isActive) {
      _timer.cancel();
      _updateDisplay(
        isFinal: true,
        message: chalk.green(
          "$tick ${message ?? ''} ${showTiming ? time + 's' : ""}",
          ftFace: ChalkFtFace.bold,
        ),
        showTiming: showTiming,
        symbol: chalk.green(
          tick,
          ftFace: ChalkFtFace.bold,
        ),
      );
    }
  }

  String get time => (elapsed.inMilliseconds / 1000.0).toStringAsFixed(1);

  void _updateDisplay({
    bool isFinal = false,
    bool cancelled = false,
    String? message,
    bool showTiming = false,
    String? symbol,
  }) {
    var char = chalk.green(_frames[_timer.tick % _frames.length]);
    if (isFinal || cancelled) {
      char = '';
    }
    if (_hideCursor) {
      io.stdout.write(ansiEscapes.cursorHide);
    }
    io.stdout.write('${ansi.backspace}$char${_spinner.isLinear ? "\b" : ""}');
    if (isFinal || cancelled) {
      io.stdout.write(ansiEscapes.cursorShow);
      if (message != null) {
        io.stdout.write(message.isEmpty ? ' ' : message);
      } else if (showTiming) {
        io.stdout.write('${symbol ?? ""} $time s');
      } else {
        io.stdout.write(' ');
      }
      io.stdout.writeln();
    }
  }

  @override
  void error({
    String? message,
    bool showTiming = false,
  }) {
    if (_timer.isActive) {
      _timer.cancel();
      _updateDisplay(
        isFinal: true,
        message: chalk.red(
            "$cross ${message ?? ''} ${showTiming ? time + 's' : ""}",
            ftFace: ChalkFtFace.bold),
        showTiming: showTiming,
        symbol: chalk.red(
          cross,
          ftFace: ChalkFtFace.bold,
        ),
      );
    }
  }
}
