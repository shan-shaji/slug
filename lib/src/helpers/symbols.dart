import 'dart:io' as io;

bool isUnicodeSupported() {
  if (io.Platform.isLinux || io.Platform.isMacOS) return true;

  return io.Platform.environment["WT_SESSION"] == null ||
      io.Platform.environment["TERM_PROGRAM"] == "vscode";
}

String tick = isUnicodeSupported() ? "✔" : "√";
String cross = isUnicodeSupported() ? "✖" : "×";
