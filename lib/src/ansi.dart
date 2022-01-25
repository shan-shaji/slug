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

  String get backspace => '\b';

  String get bullet => io.stdout.supportsAnsiEscapes ? '•' : '-';
}
