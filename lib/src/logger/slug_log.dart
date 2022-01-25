import 'package:slug/progress.dart';
import 'package:slug/src/ansi.dart';
import 'package:slug/src/logger/standared_logger.dart';
import 'package:slug/src/logger/verbose_logger.dart';

/// An abstract representation of a [Slug] - used to pretty print errors,
/// standard status messages, trace level output, and indeterminate progress.
abstract class Slug {
  /// Create a normal [Slug]; this logger will not display trace level output.
  factory Slug.standard({Ansi? ansi}) => StandardLogger(ansi: ansi);

  /// Create a [Slug] that will display trace level output.
  /// If [logTime] is `true`, this logger will display the time of the message.
  factory Slug.verbose({Ansi? ansi, bool logTime = true}) {
    return VerboseLogger(ansi: ansi, logTime: logTime);
  }

  Ansi get ansi;

  bool get isVerbose;

  /// Print an error message.
  void stderr(String message);

  /// Print a standard status message.
  void stdout(String message);

  /// Print trace output.
  void trace(String message);

  /// Print text to stdout, without a trailing newline.
  void write(String message);

  /// Print a character code to stdout, without a trailing newline.
  void writeCharCode(int charCode);

  /// Start an indeterminate progress display.
  Progress progress(String message);

  /// Flush any un-written output.
  @Deprecated('This method will be removed in the future')
  void flush();
}
