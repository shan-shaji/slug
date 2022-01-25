import 'package:slug/slug.dart';

class SlugProgress implements Slug {
  @override
  Ansi ansi;

  SlugStyle slugStyle;

  SlugProgress({Ansi? ansi, SlugStyle? slugStyle})
      : slugStyle = slugStyle ?? SlugStyle.dots,
        ansi = ansi ?? Ansi(Ansi.terminalSupportsAnsi);

  Progress? _currentProgress;

  @override
  void stdout(String message) {
    _cancelProgress();
    print(message);
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
        ? AnsiProgress(ansi, message, slugStyle)
        : SimpleProgress(this, message);
    _currentProgress = progress;
    return progress;
  }
}
