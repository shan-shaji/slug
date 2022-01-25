import 'dart:async';
import 'package:slug/slug.dart';

Future<void> main(List<String> args) async {
  var verbose = args.contains('-v');
  var logger = verbose ? Slug.verbose() : Slug.standard(ansi: Ansi(true));

  logger.stdout('Hello world!');
  logger.trace('message 1');
  await Future.delayed(Duration(milliseconds: 200));
  logger.trace('message 2');
  logger.trace('message 3');

  var progress = logger.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true);
  logger.stdout('All ${logger.ansi.emphasized('done')}.');
}
