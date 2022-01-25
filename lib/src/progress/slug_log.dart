import 'package:slug/src/enums/slug_style.dart';
import 'package:slug/src/progress/progress.dart';
import 'package:slug/src/ansi.dart';
import 'package:slug/src/progress/slug_progress.dart';

/// An abstract representation of a [Slug] - used to pretty print errors,
/// standard status messages, trace level output, and indeterminate progress.
abstract class Slug {
  /// Create a normal [Slug]; this logger will not display trace level output.
  factory Slug.standard({Ansi? ansi, SlugStyle? slugStyle}) =>
      SlugProgress(ansi: ansi, slugStyle: slugStyle);

  Ansi get ansi;

  /// Print an error message.
  void stderr(String message);

  /// Print a standard status message.
  void stdout(String message);

  /// Print text to stdout, without a trailing newline.
  void write(String message);

  /// Print a character code to stdout, without a trailing newline.
  void writeCharCode(int charCode);

  /// Start an indeterminate progress display.
  Progress progress(String message);
}
