import 'dart:async';
import 'package:slug/slug.dart';

Future<void> main(List<String> args) async {
  var logger = Slug.standard(ansi: Ansi(true), slugStyle: SlugStyle.arrow);

  logger.stdout('Hello world!');
  await Future.delayed(Duration(milliseconds: 200));

  var progress = logger.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true, message: "Completed!");
}
