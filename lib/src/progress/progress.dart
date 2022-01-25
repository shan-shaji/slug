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

  /// Finishes the slug and displays error message
  void error({String? message, bool showTiming = false});
}
