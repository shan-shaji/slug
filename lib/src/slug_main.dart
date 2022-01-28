import 'package:slug/src/enums/slug_style.dart';
import 'package:slug/src/progress/progress.dart';
import 'package:slug/src/helpers/ansi.dart';
import 'package:slug/src/progress/slug_progress.dart';

/// An abstract representation of a [Slug]
/// indeterminate progress.
abstract class Slug {
  /// Create a normal [Slug];
  factory Slug({
    Ansi? ansi,
    SlugStyle? slugStyle,
  }) =>
      SlugProgress(
        ansi: ansi,
        slugStyle: slugStyle,
      );

  /// Print a standard status message.
  void stdout(String message);

  /// Start an indeterminate progress display.
  Progress progress(String message);
}
