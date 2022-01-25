import 'dart:async';
import 'dart:io' as io;

import 'package:chalk/chalk.dart';
import 'package:slug/src/helpers/ansi.dart';
import 'package:slug/src/enums/slug_style.dart';
import 'package:slug/src/helpers/spinners.dart';
import 'package:slug/src/helpers/symbols.dart';
import 'package:slug/src/progress/progress.dart';

class AnsiProgress extends Progress {
  var ch = Chalk();
  late List<String> _frames;

  final Ansi ansi;

  late final Timer _timer;

  AnsiProgress(this.ansi, String message, SlugStyle slugStyle)
      : super(message) {
    Spinner spinner = getFrame(slugStyle);
    _frames = spinner.frames;
    _timer = Timer.periodic(Duration(milliseconds: spinner.interval), (t) {
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
          " $tick ${message ?? ''}",
          ftFace: ChalkFtFace.bold,
        ),
        showTiming: showTiming,
        symbol: ch.green(
          ' $tick',
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
    var char = ch.green(_frames[_timer.tick % _frames.length]);
    if (isFinal || cancelled) {
      char = '';
    }
    io.stdout.write('${ansi.backspace}$char');
    if (isFinal || cancelled) {
      if (message != null) {
        io.stdout.write(message.isEmpty ? ' ' : message);
      } else if (showTiming) {
        var time = (elapsed.inMilliseconds / 1000.0).toStringAsFixed(1);
        io.stdout.write(' ${symbol ?? ""} $time s');
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
        message: ch.red(" $cross ${message ?? ''}", ftFace: ChalkFtFace.bold),
        showTiming: showTiming,
        symbol: ch.red(" $cross", ftFace: ChalkFtFace.bold),
      );
    }
  }
}
