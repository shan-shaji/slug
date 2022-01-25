import 'dart:io' as io;

/// A small utility class to make it easier to work with common ANSI escape
/// sequences.
class Ansi {
  /// Return whether the current stdout terminal supports ANSI escape sequences.
  static bool get terminalSupportsAnsi =>
      io.stdout.supportsAnsiEscapes &&
      io.stdioType(io.stdout) == io.StdioType.terminal;

  final bool useAnsi;

  Ansi(this.useAnsi);

  String get cyan => _code('\u001b[36m');

  String get green => _code('\u001b[32m');

  String get magenta => _code('\u001b[35m');

  String get red => _code('\u001b[31m');

  String get yellow => _code('\u001b[33m');

  String get blue => _code('\u001b[34m');

  String get gray => _code('\u001b[1;30m');

  String get noColor => _code('\u001b[39m');

  String get none => _code('\u001b[0m');

  String get bold => _code('\u001b[1m');

  String get reversed => _code('\u001b[7m');

  String get backspace => '\b';

  String get bullet => io.stdout.supportsAnsiEscapes ? '•' : '-';

  /// Display [message] in an emphasized format.
  String emphasized(String message) => '$bold$message$none';

  /// Display [message] in an subtle (gray) format.
  String subtle(String message) => '$gray$message$none';

  /// Display [message] in an error (red) format.
  String error(String message) => '$red$message$none';

  String greenF(String message) => '$green$message$none';

  String _code(String ansiCode) => useAnsi ? ansiCode : '';
}
